House Price Tracker
===================

This was written to track the price of our house from Zoopla.

We scrape the data using nokogiri and write it to a sqlite database.

Why sqlite? This is a single-user application that will have no write contention, so why not use something that has a minimum amount of operations overhead?
