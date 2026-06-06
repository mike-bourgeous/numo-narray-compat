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

gem 'numo-narray', github: 'mike-bourgeous/numo-narray-compat.git', ref: 'compat-9-9999'
gem 'numo-narray-alt', '~> 0.10.4'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
