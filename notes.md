1) ask rachel about that bug where I passed in a referredBy and it fails the first time but it passes with 200 the second. It's a github file. Revert back to that github repo.
2) What kind of file is payload? It seems to be interacting with other models and classes. It seems to be against what we learned in other
projects.... but it seems like everyone seems to have the payload model interact with other models... which is different from what I learned. Also, is the server file not the high level application file that dips into other models? Is server.rb not a controller? Is it just a routes file? Should server.rb hold any logic? If not, then do I need to create a controller file that dips into all of the models including payload?
3) In payloads migration file, why do we need the :urls?
foreign_key   :url_id, :urls

4) How do I use the drop_column or rename_colum method?

5) alias problem in the payload.rb file in the self.sorted_by_urls method. We want to know how to create aliases because we have overlapping column names when we join tables together. How do we fix this?

6) Why do we need to wrap model_helper in TrafficSpy module

7) When a curl payload comes in with a requestedIn:01, it breaks. when requestedIn:11, it's chillin'.

8) explain ENV_TEST_ENV. What is my default environemtn when I just raun rake? Why do I need to run TRAFFIC_SPY_ENV=test rake db:reset and then TRAFFIC_SPY_ENV=test rake db:migrate

9) teardown isn't working

9.5) How do capybara tests work?

10) What does these line do:

a)
Sequel::Migrator.run(@database, "db/migrations", :target => 0)

b)
ENV["TRAFFIC_SPY_ENV"] ||= "test"

c)
require "bundler/gem_tasks" #what is this?
Bundler.require

require 'rake/testtask'

Rake::TestTask.new do |t|
t.pattern = "test/*/*_test.rb"
end

task :default => "test"

d)
Say I am curious what:
require 'rake/testtask'
is doing... what is the best way to research this?
