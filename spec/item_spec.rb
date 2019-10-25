require './lib/item'

describe Item do
  subject { described_class.new("test item", 1, 3) }
  it "must have a quality value" do
    expect { Item.new("item without quality", 1) }.to raise_error "wrong number of arguments (given 2, expected 3)"
  end
  it "has a name" do
    expect(subject.name).to eq('test item')
  end
  it "has a sellln value" do
    expect(subject.sell_in).to eq(1)
  end
  it "has a quality value" do
    expect(subject.quality).to eq(3)
  end
end
