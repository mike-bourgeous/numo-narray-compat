#!/usr/bin/env ruby
# Trivial validation that numo-narray-alt loads and provides Numo::NArray.

require 'bundler/setup'
require 'numo/narray/compat'

raise 'Numo::NArray is not present' unless defined?(Numo::NArray)
raise 'Numo::NArray does not function' unless Numo::SFloat[1,2,3].sum == 6
raise 'Numo::NArray is not the alternate version' unless Numo::NArray.respond_to?(:alternative?) && Numo::NArray.alternative?

puts "\e[1;32mNumo::NArray loaded successfully\e[0m"
