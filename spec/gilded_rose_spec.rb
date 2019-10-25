# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    describe 'for standard items' do
      it "does not change the name" do
        items = [Item.new("fixme", 0, 0)]
        GildedRose.update_quality(items)
        expect(items[0].name).to eq "fixme"
      end
      it "reduces the sellin value of the input items" do
        items = [Item.new("item", 3, 2)]
        GildedRose.update_quality(items)
        expect(items[0].sell_in).to eq(2)
      end
      it "reduces the quality value of the input items" do
        items = [Item.new("item", 3, 2)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(1)
      end
      it "reduces the quality value by 2 once the sell by date reached" do
        items = [Item.new("standard_item", 0, 2)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
      it 'never reduces the quality of an item once it is zero' do
        items = [Item.new("standard_item", 3, 0)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
    end

    describe 'for Aged Brie items' do
      it 'increases the quality of Aged Brie items' do
        items = [Item.new("Aged Brie", 3, 5)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(6)
      end
      it 'increases the quality of Aged Brie items by 2 once sell by date reached' do
        items = [Item.new("Aged Brie", 0, 5)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(7)
      end
      it 'never increases the quality of Aged Brie items above 50' do
        items = [Item.new("Aged Brie", 3, 50)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(50)
      end
    end

    describe 'for Sulfuras items' do
      it 'never decreases the quality for Sulfuras items' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 80)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(80)
      end
      it 'never decreases the sell_i for Sulfuras items' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 40)]
        GildedRose.update_quality(items)
        expect(items[0].sell_in).to eq(3)
      end
    end

    describe 'for Backstage Pass items' do
      it 'never increases the quality of Backstage Pass items above 50' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(50)
      end
      it 'increases the quality of backstage pass items by 1 when sell_in is > 10' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(41)
      end
      it 'increases the quality of backstage pass items by 2 when sell_in is <=10' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(42)
      end
      it 'increases the quality of backstage pass items by by 3 when sell_in is <=5' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(43)
      end
      it 'sets quality of backstage pass to zero once sell_in is zero' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
      it 'does not increase the quality of backstage pass items if sell_in is less than zero' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 0)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
    end

    describe 'for Conjured items' do
      it "reduces the sellin value of the conjured items" do
        items = [Item.new("Conjured Mana Cake", 3, 2)]
        GildedRose.update_quality(items)
        expect(items[0].sell_in).to eq(2)
      end
      it "reduces the quality value of the conjured items by 2" do
        items = [Item.new("Conjured Mana Cake", 3, 2)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
      it "reduces the quality value by 4 of the conjured items once the sell by date reached" do
        items = [Item.new("Conjured Mana Cake", 0, 6)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(2)
      end
      it 'never reduces the quality of a conjured item once it is zero' do
        items = [Item.new("Conjured Mana Cake", 3, 0)]
        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(0)
      end
    end
  end

end
