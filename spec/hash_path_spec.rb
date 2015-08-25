require 'spec_helper'

describe HashPath do
  it 'has a version number' do
    expect(HashPath::VERSION).not_to be nil
  end

  it "returns nil when the path ain't found" do
    expect({'foo' => 'bar'}.at_path('foo/bar/baz[1]/ferg[*]/blah/blah')).to be nil
  end

  it "returns the entire hash when the root path '/' has been defined" do
    expect({'foo' => ['bar', 'baz']}.at_path('/')).to eq({'foo' => ['bar', 'baz']})
  end

  it "returns the value of each item in an array at a given path" do
    expect({'foo' => {'bar' => [{'baz' => 'bam'}, {'baz' => 'jam'}, {'baz' => ['ham']}]}}.at_path('foo/bar[*]/baz')).to eq ["bam", "jam", ["ham"]]
  end

  it "returns the correct value when a numerical index has been provided" do
    expect({'foo' => ['bar', 'baz']}.at_path('foo[1]')).to eq 'baz'
  end

  it "returns the correct value when a negative numerical index has been provided" do
    expect({'foo' => ['bar', 'baz', 'barn']}.at_path('foo[-1]')).to eq 'barn'
  end

  it "returns the last value with the last() predicate has been provided" do
    expect({'foo' => ['bar', 'baz']}.at_path('foo[last()]')).to eq 'baz'
  end

  it "returns the first value with the first() predicate has been provided" do
    expect({'foo' => ['bar', 'baz']}.at_path('foo[first()]')).to eq 'bar'
  end
end
