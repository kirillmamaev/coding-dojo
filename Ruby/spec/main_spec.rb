# frozen_string_literal: true

require "main"

describe Main do
  subject(:main) { described_class.new }

  it "prints the correct message" do
    expect(described_class.new.print_message).to eq("This is main.rb file in Ruby dojo!")
  end
end
