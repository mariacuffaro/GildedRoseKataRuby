class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0
  SELL_BY_DATE = 0
  QUALITY_CHANGE_AMOUNT = { 'Aged Brie' => [1, 2],
                            'Conjured Mana Cake' => [-2, -4],
                            'Default' => [-1, -2] }

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.name == 'Sulfuras, Hand of Ragnaros' ? next : update(item)
      validate_quality(item)
      item.sell_in -= 1
    end
  end

  private

  def update(item)
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_backstage(item)
    else
      update_standard(item)
    end
  end

  def update_standard(item)
    QUALITY_CHANGE_AMOUNT.has_key?(item.name) ? key = item.name : key = 'Default'
    if item.sell_in > SELL_BY_DATE
      item.quality += QUALITY_CHANGE_AMOUNT[key][0]
    else
      item.quality += QUALITY_CHANGE_AMOUNT[key][1]
    end
  end

  def update_backstage(item)
    item.sell_in <= 10 ? item.quality += 2 : item.quality += 1
    item.quality += 1 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= SELL_BY_DATE
  end

  def validate_quality(item)
    item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
    item.quality = MIN_QUALITY if item.quality < MIN_QUALITY
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
