1) ask rachel about that bug where I passed in a referredBy and it fails the first time but it passes with 200 the second. It's a github file. Revert back to that github repo.


3) In payloads migration file, why do we need the :urls?
foreign_key   :url_id, :urls
Is it so that the table where this line exists knows how to populate its own table with data from :urls in the new columns

4) How do I use the drop_column or rename_colum method?

5) alias problem in the payload.rb file in the self.sorted_by_urls method. We want to know how to create aliases because we have overlapping column names when we join tables together using Sequel. How do we fix this?

6) Why do we need to wrap model_helper in TrafficSpy module in the model_helper file? How does this namespace work? Traditionally, I've only known namespacing using modules to allow us to have the same class name within two different modules. This namespacing is different? We're having a module wrap the classes of all our files so we have access to the constant DB?

7) When a curl payload comes in with a requestedIn:01, it breaks. when requestedIn:11, it's chillin'.

8) explain ENV_TEST_ENV. What is my default environemnt when I just run rake? Why do I need to run TRAFFIC_SPY_ENV=test rake db:reset  before running rake? Do I need to run this: TRAFFIC_SPY_ENV=test rake db:migrate    before running rake?


9) How do capybara tests work?

10) What does these lines do:

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
