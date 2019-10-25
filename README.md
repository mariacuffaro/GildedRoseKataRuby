## Contents
[Run/ test instructions](#Run/-test-instructions)
[Sample irb](#Sample-irb)
[Approach](#Approach)
[User Stories](#User-Stories)
[Specification](#Quality-and-value-should-be-updated-according-to-the-following-specification:-)

## Run/ test instructions
```
git clone git@github.com:mariacuffaro/GildedRoseKataRuby.git
cd GildedRoseKataRuby
bundle install
rspec #to run unit tests
ruby 'spec/texttest_fixture.rb' > new_output.txt #to run fixture tests
```
### Sample irb
```

2.5.0 :001 > require './lib/item'
 => true
2.5.0 :002 > require './lib/gilded_rose'
 => true
2.5.0 :003 > items = [
2.5.0 :004 >       Item.new("+5 Dexterity Vest", 10, 20),
2.5.0 :005 >       Item.new("Aged Brie", 2, 0),
2.5.0 :006 >       Item.new("Elixir of the Mongoose", 5, 7),
2.5.0 :007 >       Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
2.5.0 :008 >       Item.new("Sulfuras, Hand of Ragnaros", -1, 80),
2.5.0 :009 >       Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
2.5.0 :010 >       Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49),

2.5.0 :011 >       Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49),
2.5.0 :012 >       Item.new("Conjured Mana Cake", 3, 6)
2.5.0 :013?>   ]
 => [#<Item:0x00007fc2da82be60 @name="+5 Dexterity Vest", @sell_in=10, @quality=20>, #<Item:0x00007fc2da82be10 @name="Aged Brie", @sell_in=2, @quality=0>, #<Item:0x00007fc2da82bdc0 @name="
Elixir of the Mongoose", @sell_in=5, @quality=7>, #<Item:0x00007fc2da82bd48 @name="Sulfuras, Hand of Ragnaros", @sell_in=0, @quality=80>, #<Item:0x00007fc2da82bcf8 @name="Sulfuras, Hand of
 Ragnaros", @sell_in=-1, @quality=80>, #<Item:0x00007fc2da82bca8 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=15, @quality=20>, #<Item:0x00007fc2da82bc58 @name="Backstage pa
sses to a TAFKAL80ETC concert", @sell_in=10, @quality=49>, #<Item:0x00007fc2da82bc08 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=5, @quality=49>, #<Item:0x00007fc2da82bbb8
@name="Conjured Mana Cake", @sell_in=3, @quality=6>]
2.5.0 :014 > GildedRose.update_quality(items)
 => [#<Item:0x00007fc2da82be60 @name="+5 Dexterity Vest", @sell_in=9, @quality=19>, #<Item:0x00007fc2da82be10 @name="Aged Brie", @sell_in=1, @quality=1>, #<Item:0x00007fc2da82bdc0 @name="E
lixir of the Mongoose", @sell_in=4, @quality=6>, #<Item:0x00007fc2da82bd48 @name="Sulfuras, Hand of Ragnaros", @sell_in=0, @quality=80>, #<Item:0x00007fc2da82bcf8 @name="Sulfuras, Hand of
Ragnaros", @sell_in=-1, @quality=80>, #<Item:0x00007fc2da82bca8 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=14, @quality=21>, #<Item:0x00007fc2da82bc58 @name="Backstage pas
ses to a TAFKAL80ETC concert", @sell_in=9, @quality=50>, #<Item:0x00007fc2da82bc08 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=4, @quality=50>, #<Item:0x00007fc2da82bbb8 @n
ame="Conjured Mana Cake", @sell_in=2, @quality=4>]


```
# Approach

These are the steps I took to get started...

* I created a new git repsitory and create a skeleton Ruby project

* I ran 'rspec --init' to set up the test framework

* Created a gemfile and add simplecov and rubocop to it.

* Ran bundle install

* I then added the code from the Ruby folder in the [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata)

* As the tests were very limited I decided to write a full suite of tests before refactoing the code and eventually adding the new functionality.

* After refactoring the code to get a basic suite of tests passing I ran a compare of the new and legacy code using the following commands

* -> ruby 'spec/texttest_fixture.rb' > new_output.txt
* -> ruby 'spec/texttest_fixture_legacy.rb' > legacy_output.txt
* -> diff 'new_output.txt' 'legacy_output.txt' - this showed some differences which I used to

create new test cases for the new code

* Final refactor to turn into class methods rather than instance methods so that calling  GildedRose.update_quality(items) rather than GildedRose.new(items).update_quality()


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
