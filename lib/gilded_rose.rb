class GildedRose

  def initialize(items)
    @items = items
    @item_types = {type: 'standard', quality_change: -1}
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      case item.name
        when 'Aged Brie' then update_aged_brie_quality(item)
        when 'Sulfuras, Hand of Ragnaros' then update_sulfuras_item(item)
        else update_standard_item_quality(item)
      end
    end
  end

  private

  def update_aged_brie_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def update_standard_item_quality(item)
    item.sell_in >= 0 ? item.quality -= 1 : item.quality -= 2
    item.quality = 0 if item.quality < 0
  end

  def update_sulfuras_item(item)
    item.quality = item.quality
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
