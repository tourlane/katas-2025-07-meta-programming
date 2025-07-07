require "bundler"
require "rspec/autorun"

describe "#bench" do
  it "measures the time spent within the block" do
    delay = 0.1
    time = bench { sleep delay }

    expect(time).to be_within(0.01).of(delay)
  end
end

######
#
# Task: Implement a simple method to benchmark a block of code.
#
def bench
  t1 = Time.now
  yield
  Time.now - t1
end