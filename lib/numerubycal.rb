require "numerubycal/version"

unless ENV['NUMERUBYCAL_BACKEND']
  if RUBY_ENGINE =~ /jruby/
    ENV['NUMERUBYCAL_BACKEND'] = 'commons_math'
  end
end

module Numerubycal
  BACKEND = ENV['NUMERUBYCAL_BACKEND']
  require File.expand_path(File.join(File.dirname(__FILE__), "numerubycal", BACKEND)) 
end
