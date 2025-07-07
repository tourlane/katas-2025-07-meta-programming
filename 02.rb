require "bundler"
require "rspec/autorun"

# Defining `bench` in the "root" of a file will add the method to `Object`` directly.
# However that's not really a recommended approach or particularly elegant. Much more 
# common is to add the method to a module and make that module available to `Object`.
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

describe "Object#bench" do
  it "measures the time spent within the block" do
    delay = 0.1
    time = Foo.new.bar(delay)

    expect(time).to be_within(0.01).of(delay)
  end
end

######
#
# Task: Make the bench method available to all objects
#
Object.include Bench
