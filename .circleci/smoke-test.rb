#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'httparty', require: true
end

resp = HTTParty.get('https://google.com')

if resp.success?
  exit 0
else
  exit 1
end
