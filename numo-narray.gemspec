# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'numo-narray'
  spec.version = '0.9.9999-alt-compat'
  spec.authors = ['Mike Bourgeous']
  spec.email = ['contact@mikebourgeous.com']

  spec.summary = 'Compatibility wrapper to load numo-narray-alt when a gem wants numo-narray.'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/mike-bourgeous/numo-narray-compat'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  # TODO?: spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ['lib']

  spec.extensions = ['ext/headers/extconf.rb']

  spec.add_dependency 'numo-narray-alt', '>= 0.10.5'
  spec.add_dependency 'rake', '~> 13.0'
  spec.add_dependency 'rake-compiler', '~> 1.1.1'
end
