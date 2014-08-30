require 'spec_helper'

class VoidTestClass
  extend StrictReturn
  attr_accessor :foo_calls

  def initialize
    self.foo_calls = 0
  end

  void def foo
    self.foo_calls += 1
    return 'bar'
  end

  void def bar(a, b)
    return 'foo'
  end
end

describe StrictReturn do
  describe '.void' do
    it "decorates a method without hindering its execution" do
      test_class = VoidTestClass.new
      expect(test_class.foo_calls).to eq 0

      test_class.foo
      expect(test_class.foo_calls).to eq 1
    end

    it "silences the actual return value, and returns nil instead" do
      test_class = VoidTestClass.new
      expect(test_class.foo).to be_nil
    end

    it "works for methods with arguments" do
      test_class = VoidTestClass.new
      expect(test_class.bar(1,2)).to be_nil
    end
  end
end
