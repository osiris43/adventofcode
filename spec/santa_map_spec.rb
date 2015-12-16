require 'santa_map'

RSpec.describe SantaMap do
  let(:moves) {File.open('spec/moves.txt').read.chomp}
  it "counts 2 when santa is drunk" do
    map = SantaMap.new
    "^v^v^v^v".each_char do |dir|
      map.move(dir)
    end

    expect(map.houses.count).to eq(2)
  end
  
  it "counts 4 when santa is sober" do
    map = SantaMap.new
    "^>v<".each_char do |dir|
      map.move(dir)
    end

    expect(map.houses.count).to eq(4)
  end

  it "solves the puzzle" do 
    map = SantaMap.new
    moves.each_char do |dir|
      map.move(dir)
    end

    puts "Houses with presents: #{map.houses.count}"
  end

  it "solves robot santa" do 
    santa = SantaMap.new
    robo = SantaMap.new
    
    moves.each_char.with_index do |dir,idx|
      if idx % 2 == 0
        santa.move(dir)
      else
        robo.move(dir)
      end
    end

    puts "Santa houses: #{santa.houses.count}"
    puts "Robo Santa houses: #{robo.houses.count}"
    puts "Combined houses: #{(robo.houses | santa.houses).count}"
  end

end
