# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
    it "reduces the sellin value of the input items" do
      items = [Item.new("item", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(2)
    end
    it "reduces the quality value of the input items" do
      items = [Item.new("item", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(1)
    end
    it "reduces the quality value by 2 once the sell by date reached" do
      items = [Item.new("standard_item", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it 'never reduces the quality of an item once it is zero' do
      items = [Item.new("standard_item", 3, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it 'increases the quality of Aged Brie items' do
      items = [Item.new("Aged Brie", 3, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(6)
    end
    it 'increases the quality of Aged Brie items by 2 once sell by date reached' do
      items = [Item.new("Aged Brie", 0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(7)
    end
    it 'never increases the quality of Aged Brie items above 50' do
      items = [Item.new("Aged Brie", 3, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it 'never increases the quality of Backstage Pass items above 50' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it 'never decreases the quality for Sulfuras items' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(40)
    end
    it 'never decreases the sell_i for Sulfuras items' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(3)
    end
    it 'Quality of backstage pass items increase by 1 when sell_in is > 10' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(41)
    end
    it 'Quality of backstage pass items increase by 2 when sell_in is <=10' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(42)
    end
    it 'Quality of backstage pass items increase by 3 when sell_in is <=5' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(43)
    end
    it 'Quality of backstage pass items is zero once sell_in is zero' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
  end

end
