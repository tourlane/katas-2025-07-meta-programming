require "bundler"
require "rspec/autorun"

# Let's see how this reflects in Ruby's inheritance tree.
#
module Bench
  def bench
    t1 = Time.now
    yield
    Time.now - t1
  end
end

class Foo
  def bar(delay)
    bench { sleep delay }
  end
end

Object.include Bench

######
#
# Task: Add `Bench` to the list of expected ancestors
#
describe "Object.ancestors" do
  it "includes the Bench module now" do
    expected = [Object, Bench, Kernel, BasicObject]
    expect(Object.ancestors).to eq expected
  end
end