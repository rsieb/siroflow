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

@totaltimeopen = 0
@avgtimeopen = 0

@mystories.each do |verhaaltje|
  
  lastmodified = Chronic.parse(verhaaltje['fields']['updated'])
  #puts verhaaltje['key'] + ' ' + ((Time.now - lastmodified)/86400).to_s
  @totaltimeopen = @totaltimeopen + (Time.now - lastmodified)
end

puts ( @totaltimeopen / @mystories.size )/86400

