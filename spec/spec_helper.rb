require 'rspec'

$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))

require 'numerubycal'

include Numerubycal

RSpec.configure do |c|
end
