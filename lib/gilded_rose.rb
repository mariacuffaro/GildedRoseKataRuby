class GildedRose

  def initialize(items)
    @items = items
    @item_types = {type: 'standard', quality_change: -1}
  end

  def update_quality
    @items.each do |item|
      case item.name
        when 'Aged Brie' then update_aged_brie(item)
        when 'Sulfuras, Hand of Ragnaros' then update_sulfuras(item)
        when 'Backstage passes to a TAFKAL80ETC concert' then update_backstage_pass(item)
        else update_standard(item)
      end
    end
  end

  private

  def update_aged_brie(item)
    item.sell_in > 0 ? item.quality += 1 : item.quality += 2
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end

  def update_standard(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
    item.quality = 0 if item.quality < 0
    item.sell_in -= 1
  end

  def update_sulfuras(item)
    item.quality = item.quality
    item.sell_in = item.sell_in
  end

  def update_backstage_pass(item)
    item.sell_in <= 10 ? item.quality += 2 : item.quality += 1
    item.quality += 1 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

end
