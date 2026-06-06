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

# Copy the headers from numo-narray-alt so that C extensions can find narray.h
# INSTALLFILES approach modified from numo-narray-alt
root = File.expand_path('..', __dir__)
headers = Dir[File.join(extdir, '**/*.h')]
$INSTALLFILES = []
headers.each do |src|
  rel = Pathname.new(src).relative_path_from(extdir)
  FileUtils.mkdir_p(File.dirname(rel))
  FileUtils.cp(src, rel)
  $INSTALLFILES << [rel.to_s, '$(archdir)/']
end

create_makefile('headers')
