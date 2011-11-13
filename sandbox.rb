#!/usr/bin/env ruby

require 'rubygems'
require 'appscript' 


iterm = Appscript::app("iTerm")
myterminal = iterm.terminals[1]

mysession = myterminal.make(:new => :session, :with_properties => {:name => "progress session"})
mysession.exec(:command => "/bin/bash")
iterm.activate
