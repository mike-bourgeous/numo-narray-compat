require 'mkmf'
require 'fileutils'
require 'pathname'

# This require line ensures that the numo-narray-alt gem spec is loaded when installing this extension
require 'numo/narray/alt'

# Used numo-pocketfft as a reference for finding narray.h
# https://github.com/yoshoku/numo-pocketfft/blob/1ab489b165d4cde06b6d3a443ed9bfbc8e5c69d0/ext/numo/pocketfft/extconf.rb
# https://stackoverflow.com/questions/9322078/programmatically-determine-gems-path-using-bundler
na = Gem.loaded_specs['numo-narray-alt']
raise "Could not find the numo-narray-alt Gem; try running with bundle exec" if na.nil?

extdir = na.extension_dir
raise 'Could not find narray.h in numo-narray-alt' unless find_header('numo/narray.h', File.join(extdir, 'numo'))

# TODO: How do we keep up to date if numo-narray-alt is updated?
root = File.expand_path('..', __dir__)
headers = Dir[File.join(extdir, '**/*.h')]
headers.each do |h|
  h = Pathname.new(h).relative_path_from(extdir)
  src = File.join(extdir, h)
  dest = File.join(root, h)
  FileUtils.mkdir_p(File.dirname(dest))
  FileUtils.cp(src, dest, verbose: true)
end

create_makefile('headers')
