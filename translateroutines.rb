#!/usr/bin/env ruby

#ψ Set up libraries and data definitions


require 'rubygems'
require 'yaml'
require 'readline'
require 'pp'

@keuze = Dir.glob("*.routine.yaml")

=begin
### Oude structuur
{"Say A"=>[0, 1.872795, 2.114479]}, {"Say B"=>[1.518454, 2.39904]}
# Nieuwe structuur
{"Say A"=>[{"comment"=>"this is just a test", "date"=>0, "netdur"=>2.114479, "grossdur"=>12, "status"=>"f"}, {"comment"=>"this is just a 2nd test", "date"=>0, "netdur"=>1.872795, "grossdur"=>12, "status"=>"f"}]}
=end

@keuze.each do |file|
  puts "\nProcessing #{file} ...\n"
  @oude = YAML.load_file( file )
  # puts "@oude is "
  # PP.pp @oude
  @nieuwe = Array.new()
  @oude.each do |hashje|
    nummer = @oude.index(hashje)
    sleutel = hashje.keys.first
    @nieuwe[nummer] = {sleutel => Array.new()}
    waarden = hashje[sleutel]
    waarden.each_index do |waardenummer|
      @nieuwe[nummer][sleutel][waardenummer] = {
          "comment"=>nil,
          "date"=>nil,
          "netdur"=>waarden[waardenummer],
          "grossdur"=>nil,
          "status"=>nil}
    end
  end
  nieuwefile = file.gsub(".routine.yaml",".routine2.yaml")
  File.open( nieuwefile, 'w' ) do |out|
    YAML.dump( @nieuwe, out )
  end
end

