require 'present'

RSpec.describe Present do
  let(:presents) {File.open('spec/presents.txt').read.split("\n")}
  it "should calculate smallest side" do
    p = Present.new(2,3,4)
    expect(p.smallest_side_area).to eq(6)
  end

  it "calculates the present surface area" do
    p = Present.new(2,3,4)
    expect(p.surface_area).to eq(52)
  end

  it "calculates total paper needs" do
    p = Present.new(2,3,4)
    expect(p.total_paper).to eq(58)
  end

  it "calculates part one answer" do
    total = 0
    presents.each do |present|
      l, w, h = present.split("x")
      total = total + Present.new(l.to_i, w.to_i, h.to_i).total_paper
    end

    puts "TOTAL: #{total}"
  end

  it "calculates smallest perimeter" do
    p = Present.new(2,3,4)
    expect(p.smallest_perimeter).to eq(10)
  end

  it "calculates bow size" do
    p = Present.new(2,3,4)
    expect(p.bow_size).to eq(24)
  end
  
  it "calculates part two answer" do
    total = 0
    presents.each do |present|
      l, w, h = present.split("x")
      p = Present.new(l.to_i, w.to_i, h.to_i)
      total = total + p.smallest_perimeter + p.bow_size
    end

    puts "TOTAL Ribbon: #{total}"
  end
end
