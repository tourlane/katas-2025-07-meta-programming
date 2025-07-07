require "bundler"
require "rspec/autorun"

describe "#occurence_counter" do
  it "counts" do
    result = occurence_counter("to be or not to be")
    occurences = { "to" => 2, "be" => 2, "or" => 1, "not" => 1 }

    expect(result).to eq(occurences)
  end
end

def occurence_counter(phrase)
  phrase.split.tally
end
