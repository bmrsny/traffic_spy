1) ask rachel about that bug where I passed in a referredBy and it fails the first time but it passes with 200 the second. It's a github file. Revert back to that github repo.
2) What kind of file is payload? It seems to be interacting with other models and classes. It seems to be against what we learned in other
projects.... but it seems like everyone seems to have the payload model interact with other models... which is different from what I learned. Also, is the server file not the high level application file that dips into other models? Is server.rb not a controller? Is it just a routes file? Should server.rb hold any logic? If not, then do I need to create a controller file that dips into all of the models including payload?
3) In payloads migration file, why do we need the :urls?
foreign_key   :url_id, :urls
