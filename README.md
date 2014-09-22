Nerld
================
Ruby on Rails application for Non-expert Remote Lab Deployment.

Requirements
-------------

This application requires:

- Ruby 2.1.1
- Rails 4.1.0
- PostgreSQL 9.1+

Getting Started
---------------

# Mac OSX
 - Update XCode
 - Download the latest Command Line Tools (in XCode)
 - Install homebrew (http://brew.sh/)
 - Install PostgreSQL (http://postgresapp.com/)
 - Install RVM (http://rvm.io/)
 - Create postgresql user called nerld (make it superuser)
 - Run the following:

```
$ brew install node
$ rvm install ruby 2.1.1
$ rvm 2.1.1
$ gem install rails
$ git clone https://github.com/nerld/nerld_rails.git
$ cd nerld_rails
$ gem install bundler
$ bundle install
$ rake db:setup
$ rails s
```

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
