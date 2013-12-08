#!/usr/bin/env ruby -wKU

require 'json'
require 'httparty'
require 'nokogiri'

APIREF="https://rocketfuel.jira.com/rest/api/latest/"
module Jiraah
  class Issue

    attr_accessor :key,:summary,:reporter,:updated,:resolution

    def initialize(issue)
      @key      = issue['key']
      @summary    = issue['fields']['summary']
      @resolution = issue['fields']['resolution']
      @updated    = Chronic.parse(issue['fields']['updated'])
      #@created    = Chronic.parse(issue['fields']['created'])
      @reporter   = Person.new(issue['fields']['reporter'])
    end

    def self.search(query)
      mysearch    = MessyJira::Issue.search(query)
      myissues    = Array.new
      mysearch.each do |issue|
        #pp issue
        myissue   = self.new(issue)
        myissues.push(myissue)
      end
      myissues
    end

    def add_comment(commentstring)
      MessyJira::Issue.add_comment(@key,commentstring)
    end

    def close(resolution)
      closetransition = self.transitions.find{ |t| t.to_status == "Closed"}
      MessyJira::Issue.close(@key,closetransition.id,resolution)
    end

    def transitions
      mytransitions = Array.new
      MessyJira::Issue.transitions(@key)['transitions'].each do |t|
        a = Transition.new(t)
        mytransitions.push(a)
      end
      mytransitions
    end

    def self.testcase
      MessyJira::Issue.testcase
    end

  end

  class Person
    attr_accessor :displayname
#    attr_reader :firstname

    def initialize(person)
      @displayname = person['displayName']
    end

    def firstname
      @firstname = @displayname.split(" ")[0]
    end

  end

  class Transition
    attr_reader :to_status,:id

    def initialize(transition)
      @id     = transition['id']
      @to_status  = transition['to']['name']
    end
  end

end

module MessyJira

  class JIRA
    def initialize(args)
    end

    def self.json(slug,json)
      response = HTTParty.post(
        "#{APIREF}#{slug}",
        :basic_auth => self.auth,
        :headers => {'Content-Type' => 'application/json'},
      :body => json)
      doc = Nokogiri::HTML(response.body)
      doc.css('script, link').each { |node| node.remove }
      doc.css('body').text.squeeze(" \n")
    end

    def self.get(slug)
      response = HTTParty.get(
        "#{APIREF}#{slug}",
      :basic_auth => self.auth)
      JSON.parse(response.body)
    end

    def self.auth
      {:username => "robbie", :password => "ilovejira2013"}
    end

  end

  class Issue

    attr_accessor :key

    def self.testcase
      # testcase =JIRA.post("#{APIREF}issue/createmeta?projectKeys=CST",
      #                         :basic_auth => auth
      #                         )
      #pp JSON.parse(response.body)

      result = JIRA.json(
        "issue",
        {
          :fields => {
            :project => {
              :id => 10991
            },
            :summary => "Robbie testing 123 #{Time.now.strftime("%c %z")}",
            :issuetype => {
              :id => 8
            }
      }}.to_json)
      return result
    end

    def self.search(query)
      if !query
        return false
      else
        response = JIRA.json(
          "search/",{
            :jql => query,
            :maxResults => 100,
            :validateQuery => true
          }.to_json
        )
        return JSON.parse(response)["issues"]
      end
    end

    def self.add_comment(issuekey,comment)
      # TODO 2013-08-24 change add_comment into an instance method for god's sake
      if (!issuekey || !comment)
        return false
      else
        response = JIRA.json(
          "issue/#{issuekey}/comment/",{
            :body => "#{comment}"
          }.to_json
        )
        return response
      end
    end

    def self.close(issuekey,transition_id,closeresolution)
      # TODO 2013-08-24 change close into an instance method for god's sake
      if !issuekey
        return false
      else
        if closeresolution == "Won't Fix" # this means we want to set resolution explicitly
          puts "I am setting resolution explicitly"
          response = JIRA.json(
            "issue/#{issuekey}/transitions",{
              :transition => { :id => transition_id },
              :fields => {
                :resolution => {
                  :name => "Won't Fix"
                }
              }
            }.to_json
          )
        else # close without changing the resolution object
          response = JIRA.json(
            "issue/#{issuekey}/transitions",{
              :transition => { :id => transition_id }
            }.to_json
          )
        end
        return response
      end
    end

    def self.transitions(issuekey)
      if !issuekey
        return false
      else
        response = JIRA.get("issue/#{issuekey}/transitions")
        return response
      end
    end

  end
end
