#!/usr/bin/env ruby -KU

require 'rubygems'
require 'rest_client'
require 'json'

# get the location through a dedicated tool

# newloc = `/Users/rs/bin/whereami`
# #puts loc
# #puts loc.class
# #puts loc.lines.count

# # parse out the coordinates
# if newloc.lines.count < 4
  loc = File.read("/tmp/location.txt")
# else
#   loc = newloc
#   File.open("/tmp/location.txt", "w") do |f|
#     f.write newloc
#   end
# end

lati  = loc.match(/Latitude: (\d+.\d+)/)[1]
longi = loc.match(/Longitude: (\d+.\d+)/)[1]


# get the municipality from the coordinates

uri = "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{lati},#{longi}&sensor=true"
geojson = RestClient.get uri
#puts geojson
geodata = JSON.parse(geojson)
coordinates = geodata['results'][0]['address_components']
#puts coordinates
#puts coordinates.class
city =      coordinates.select{|l| l['types'] == ["locality", "political"]}.collect{|m| m['short_name']}[0]
province =  coordinates.select{|l| l['types'] == ["administrative_area_level_1", "political"]}.collect{|m| m['short_name']}[0]
country =   coordinates.select{|l| l['types'] == ["country", "political"]}.collect{|m| m['short_name']}[0]
if country == "US"
  puts "#{city}, #{province}"
else
  puts "#{city}, #{province}, #{country}"
end
