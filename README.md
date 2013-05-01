# The Guild

[![Build
Status](https://travis-ci.org/kabisaict/theguild.nl.png?branch=2.0)](https://travis-ci.org/kabisaict/theguild.nl)

## Introduction

This the application behind the [theguild.nl][] website.

## Setup

To get started with this project, make sure your environment meets the
following requirements:

1. A working installation of [PostgreSQL][], version 9.1 or higher. Install on
   Mac OSX with [Homebrew][]: `brew install postgres`.
2. A working installation of [Ruby][], version 2.0.0 or higher, along with Ruby
   gems. Ruby 1.8 is not supported. Install using [RVM][], [Rbenv][] or
   [Homebrew][] on Mac OSX: `brew install ruby`.

Once that works, set up the project:

1. Clone the repository: `git clone git@github.com:kabisaict/theguild.nl.git`
2. Install the Bundler gem: `gem install bundler`
3. Let Bundler install any other gem dependencies: `bundle install`
4. Copy `config/database.example.yml` to `config/database.yml` and enter your
   own settings.
5. Set up correct environment variables (see next section).
6. Set up your local database using `rake db:setup`.
7. Start a local web server with `rails server` or Foreman: `foreman start`.
8. Open the site at `http://localhost:3000`, where `3000` is the `PORT`
   variable you defined in `.env`.

### Exporting required environment variables

Mirroring Heroku, the application depends on various environment variables to
be set in order to run correctly. These variables are present at Heroku
applications, but can be cumbersome to set manually in development on your
local machine. 

There are several solutions to this problem, allowing you to save such
variables in a local, untracked file:

1. Run tasks using Foreman, e.g. `foreman run rake db:setup`. Foreman will
   export environment variables defined in `.env`. Create your own `.env` file
   by using `env.example` as a template.
2. If you use [Rbenv][], you could use the [rbenv-vars][] plugin to define
   environment variables in a `./rbenv-vars` file, which are exported when you
   enter the project directory (so no need to use Foreman).
3. If you use [RVM][] you could set the variables in your [rvmrc][] file, also
   removing the need for Foreman.

## Testing

### Running test suite

The spec suite uses Rspec for all tests. There are no cucumber features. To run
the test suite, use the default Rails Rake tasks or run `rspec spec`.

Note you can skip potentially slow integration tests by their `js` tag: `rspec
spec --tags ~js`.

### Continuous Integration

All branches, including `master`, `develop` and any open pull requests on
Github, are automatically tested by [Travis
CI][travis].

[RVM]:         http://rvm.io
[Homebrew]:    http://mxcl.github.com/homebrew/
[Rbenv]:       https://github.com/sstephenson/rbenv
[travis]:      https://magnum.travis-ci.com/kabisaict/theguild.nl
[rbenv-vars]:  https://github.com/sstephenson/rbenv-vars
[rvmrc]:       https://rvm.io/workflow/rvmrc/
[theguild.nl]: http://theguild.nl
[PostgreSQL]:  http://www.postgresql.org
[Ruby]:        http://www.ruby-lang.org
