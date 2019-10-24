# Approach

These are the steps I took to get started...

* I created a new git repsitory and create a skeleton Ruby project

* I ran 'rspec --init' to set up the test framework

* Created a gemfile and add simplecov and rubocop to it.

* Ran bundle install

* I then added the code from the Ruby folder in the [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata)

* As the tests were very limited I decided to write a full suite of tests before refactoing the code and eventually adding the new functionality.

* After refactoring the code to get a basic suite of tests passing I ran a compare of the new and legacy code using the following commands

* -> ruby 'spec/texttest_fixture.rb' > new__output.txt
* -> ruby 'spec/texttest_fixture_legacy.rb' > legacy_output.txt
* -> diff 'new_output.txt' 'legacy_output.txt' - this showed some differences which I used to create new test cases for the new code


## Test instructions

run rspec to run guilded_rose_spec.rb

use following irb commands to run the texttest_fixtue.rb
```
2.5.0 :003 > require './lib/gilded_rose'
2.5.0 :004 > require './spec/texttest_fixture.rb'
```
and to run guilded_rose_tests.rb
```
2.5.0 :001 > require './spec/gilded_rose_tests.rb'
 => true
2.5.0 :002 > exit
```
which will git the following output
```
Loaded suite irb
Started
.
Finished in 0.00069 seconds.
-----------------------------------------------------------------------------------------------------------------------------------
1 tests, 1 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
-----------------------------------------------------------------------------------------------------------------------------------
1449.28 tests/s, 1449.28 assertions/s
```


# User Stories
```
As an innkeeper
I want to know the quality of my Items
So that I know the value of them

As an innkeeper
I want to know how far away the sell by date is for an item
So that I can avoid selling out of date Items

```

# Quality and value should be updated according to the following specification:-

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*
