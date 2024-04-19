# frozen_string_literal: true

require "spec_helper"
require "twelve_days_of_christmas/twelve_days_of_christmas"

module TwelveDaysOfChristmas
  RSpec.describe TwelveDaysOfChristmas do
    it "returns the first verse of the song" do
      expect(described_class.new.verse(1)).to eq(
        "On the first day of Christmas/n" \
        "My true love gave to me:/n" \
        "A partridge in a pear tree."
      )
    end

    it "returns the first Aussie verse of the song" do
      expect(described_class.new(locale: :en_au).verse(1)).to eq(
        "On the first day of Christmas/n" \
        "My true love gave to me:/n" \
        "A kookaburra in a gum tree."
      )
    end

    it "returns the second verse when asked" do
      expect(described_class.new.verse(2)).to eq(
        "On the second day of Christmas/n" \
        "My true love gave to me:/n" \
        "Two turtle doves,/n" \
        "And a partridge in a pear tree."
      )
    end

    it "returns the third verse when asked" do
      expect(described_class.new.verse(3)).to eq(
        "On the third day of Christmas/n" \
        "My true love gave to me:/n" \
        "Three french hens,/n" \
        "Two turtle doves,/n" \
        "And a partridge in a pear tree."
      )
    end
  end
end
