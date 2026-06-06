require "bundler/gem_tasks"
require 'rake/extensiontask'

Rake::ExtensionTask.new 'compat' do |ext|
  ext.name = 'headers'
  ext.ext_dir = 'ext/headers'
  ext.lib_dir = 'lib/numo/narray/compat'
end
