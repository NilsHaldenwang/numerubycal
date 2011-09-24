require 'java'
include Java

require File.expand_path(File.join(File.dirname(__FILE__), "commons_math", "commons-math-2.2")) 

module Numerubycal
  autoload :Vector, "numerubycal/commons_math/linear_algebra/vector"
end
