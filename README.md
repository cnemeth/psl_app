# README

## Prerequisites

- RubyGems version: 2.6.8
- RVM version: 1.28.0
- Ruby version: 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]
- Rails version: 5.0.1
- MySQL server version: 5.7.17 Homebrew

Assuming mysql, rubygems, rvm and bundler are installed already.

## Setup the app.
```
$ git clone git@github.com:cnemeth/psl_app.git
$ cd psl_app
$ bundle
```
Setup Database
```
$ bin/rails db:create db:migrate db:seed
```

## Running the test suite
```
$ bin/rspec
```
or
```
$ bin/guard
```

## Running the app

Starting the server
```
$ bin/rails s
```

In the browser

```
http://localhost:3000
```
