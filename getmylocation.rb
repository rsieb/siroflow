#!/usr/bin/env ruby -KU

require 'rubygems'
require 'bundler/setup'
require 'restclient'
require 'growl'
require 'json'


# capture if in-flight
#ssid = system("/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I|grep \" SSID:\" | cut -c 18-")
ssid = `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | /usr/bin/grep \" SSID:\" | /usr/bin/cut -c 18-`.chomp
Growl.notify "__#{ssid}__", :icon => :Maps
if ssid == "gogoinflight"
  location = "In flight"
elsif ssid == "CyberRoland"
  location = "WFH@SF 4159873440"
elsif ssid == "ghNet"
  location = "Wouw, NL ~#{(Time.now+1800).strftime("%l%P %Z").lstrip}" 
else
  # get the location through a dedicated tool

  newloc = `/Users/rs/bin/whereami`
  # puts newloc
  # puts newloc.class
  # puts newloc.lines.count

  # parse out the coordinates
  if newloc.lines.count < 4
    loc = File.read("/tmp/location.txt")
  else
    loc = newloc
    File.open("/tmp/location.txt", "w") do |f|
      f.write newloc
    end
  end

  lati  = newloc.match(/Latitude: (-?\d+.\d+)/)[1] rescue nil
  longi = newloc.match(/Longitude: (-?\d+.\d+)/)[1] rescue nil
  # puts lati
  # puts longi

  # get the municipality from the coordinates

  if (!lati || !longi)
    location = ""
  else
    uri = "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{lati},#{longi}&sensor=true"
    geojson = RestClient.get uri
    #puts geojson
    geodata = JSON.parse(geojson)
    File.open("/tmp/geodata.json", "w") do |f|
      f.write geodata
    end
    coordinates = geodata['results'][0]['address_components']
    #puts coordinates
    #puts coordinates.class
    city      = coordinates.select{|l| l['types'] == ["locality", "political"]}.collect{|m| m['short_name']}[0]
    county    = coordinates.select{|l| l['types'] == ["administrative_area_level_2", "political"]}.collect{|m| m['short_name']}[0]
    province  = coordinates.select{|l| l['types'] == ["administrative_area_level_1", "political"]}.collect{|m| m['short_name']}[0]
    country   = coordinates.select{|l| l['types'] == ["country", "political"]}.collect{|m| m['short_name']}[0]
    if city
      location = "#{city}, #{province}"
    else
      location = "#{county}, #{province}"
    end
    unless country == "US"
      location = location + ", #{country}"
    end
  end
end
Growl.notify location, :icon => :Maps
puts location
