# encoding: utf-8

#!/usr/bin/env ruby -KU

require 'bundler/setup'
require 'rubygems'
require 'pp'
require 'httparty'
require 'nokogiri'
require 'json'
require 'chronic'
require './jira_client.rb'


response = JIRA.json(
  "search/",{
    :jql => %q(assignee = currentUser() AND resolution is EMPTY AND type != Epic ORDER BY updatedDate DESC),
    :maxResults => 25,
    :validateQuery => true
  }.to_json
)


@mystories = Array.new()
@mystories = JSON.parse(response)["issues"]

#puts @mystories.size

#Story,Labels,Story Type,Estimate,Current State
#puts "Story,Labels,Story Type,Estimate,Current State"
@mystories.each do |verhaaltje|
  fieldline = ""
  #puts verhaaltje
  # fieldline << '"' + verhaaltje['key'] + ' ' + verhaaltje['fields']['summary'].gsub(/"/, '`' ).gsub(/'/, '`' )
  fieldline << verhaaltje['fields']['reporter']['name'] + ': '
  fieldline << verhaaltje['key'] + ' ' + verhaaltje['fields']['summary'].gsub(/"/, '`' ).gsub(/'/, '`' )
  #fieldline << '" '
  fieldline << ' ' + verhaaltje['fields']['updated'][5..15]
  # fieldline << ' +jira'
  # fieldline << ",feature,"
  # fieldline << verhaaltje['customfield_10093'].to_s
  # fieldline << ",unstarted"
  fieldline << "\n"
  puts fieldline
end

