[![Actions Status](https://github.com/ponttor/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/ponttor/rails-project-lvl1/actions)
[![Actions Status](https://github.com/ponttor/rails-project-lvl1/workflows/lint-test/badge.svg)](https://github.com/ponttor/rails-project-lvl1/actions)

# HexletCode

A gem whick helps to create forms in website templates. It allows to reduce the form description code many times over due to automatic error handling and various controls.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input name="commit" type="submit" value="Save" >
# </form>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

