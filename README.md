# Numo::NArray wrapper to load numo-narray-alt

This is a wrapper with a high version number to allow mixing gems that depend
on [numo-narray](https://github.com/ruby-numo/numo-narray) with those that use
[numo-narray-alt](https://github.com/yoshoku/numo-narray-alt).  The new,
alternate version of numo-narray has fixes for new versions of Ruby, support
for new compilers, etc.

My appreciation goes to the creators and maintainers of both numo-narray and
numo-narray-alt for keeping numerical computing going within Ruby.

## Installation

Because this uses the `numo-narray` name, it cannot be pushed to central gem
repositories like rubygems.org.  Instead, you must refer to the git repository.
You should also add a version range dependency for numo-narray-alt.

```ruby
# Add to your Gemfile

# If your gems depend on "~> 0.9.2" or similar:
gem 'numo-narray', github: 'mike-bourgeous/numo-narray-compat.git', ref: 'compat-9-9999'

# If your gems depend on "~> 0.9.2.1" or similar:
gem 'numo-narray', github: 'mike-bourgeous/numo-narray-compat.git', branch: 'compat-9-2-x'

gem 'numo-narray-alt', '~> 0.10.4'
```

If you want to retrieve numo-narray-alt from a Git source and you get `cannot
load such file -- numo/narray/alt` when running a fresh `bundle install`, you
will need to install it from rubygems.org first.  It appears Bundler cannot
resolve installation order between two git-sourced gems.

```bash
gem install numo-narray-alt
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
