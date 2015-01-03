1) ask rachel about that bug where I passed in a referredBy and it fails the first time but it passes with 200 the second. It's a github file. Revert back to that github repo.
2) What kind of file is payload? It seems to be interacting with other models and classes. It seems to be against what we learned in other
projects.... but it seems like everyone seems to have the payload model interact with other models... which is different from what I learned. Also, is the server file not the high level application file that dips into other models? Is server.rb not a controller? Is it just a routes file? Should server.rb hold any logic? If not, then do I need to create a controller file that dips into all of the models including payload?
3) In payloads migration file, why do we need the :urls?
foreign_key   :url_id, :urls

4) How do I use the drop_column or rename_colum method?

5) alias problem in the payload.rb file in the self.sorted_by_urls method. We want to know how to create aliases because we have overlapping column names when we join tables together. How do we fix this?

6) Why do we need to wrap model_helper in TrafficSpy module
