require 'elevator'

RSpec.describe Elevator do
  it "should move up" do
    e = Elevator.new
    expect(e.move('(')).to eq(1)
  end
  
  it "should move down" do
    e = Elevator.new
    expect(e.move(')')).to eq(-1)
  end

  it "solves the puzzle" do
    e = Elevator.new
    instructions = File.open('spec/instructions.txt')
    floor = e.move(instructions.read.chomp)
    puts "Floor: #{floor}"
  end

  it "reports the basement character" do
    e = Elevator.new
    e.move(')')
    expect(e.basement_char).to eq(1)
  end

  it "solves the second part" do
    e = Elevator.new
    instructions = File.open('spec/instructions.txt')
    e.move(instructions.read.chomp)

    puts "Basement: #{e.basement_char}"
  end
end

