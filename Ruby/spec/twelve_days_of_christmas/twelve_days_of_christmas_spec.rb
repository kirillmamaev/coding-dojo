# frozen_string_literal: true

require "spec_helper"
require "twelve_days_of_christmas/twelve_days_of_christmas"

module TwelveDaysOfChristmas
  RSpec.describe TwelveDaysOfChristmas do
    it "returns the first verse of the song" do
      expect(described_class.new.verse(1)).to eq(
        "On the first day of Christmas\n" \
        "My true love gave to me:\n" \
        "A partridge in a pear tree."
      )
    end

    it "returns the first Aussie verse of the song" do
      expect(described_class.new(locale: :en_au).verse(1)).to eq(
        "On the first day of Christmas\n" \
        "My true love gave to me:\n" \
        "A kookaburra in a gum tree."
      )
    end

    it "returns the second verse when asked" do
      expect(described_class.new.verse(2)).to eq(
        "On the second day of Christmas\n" \
        "My true love gave to me:\n" \
        "Two turtle doves,\n" \
        "And a partridge in a pear tree."
      )
    end

    it "returns the third verse when asked" do
      expect(described_class.new.verse(3)).to eq(
        "On the third day of Christmas\n" \
        "My true love gave to me:\n" \
        "Three french hens,\n" \
        "Two turtle doves,\n" \
        "And a partridge in a pear tree."
      )
    end

    it "returns the third Aussie verses of the song" do
      expect(described_class.new(locale: :en_au).verse(3)).to eq(
        "On the third day of Christmas\n" \
        "My true love gave to me:\n" \
        "Three wet galahs,\n" \
        "Two snakes on skis,\n" \
        "And a kookaburra in a gum tree."
      )
    end

    it "returns the Twelve Aussie verses of the song" do
      expect(described_class.new(locale: :en_au).verse(12)).to eq(
        "On the twelfth day of Christmas\n" \
        "My true love gave to me:\n" \
        "Twelve possums playing,\n" \
        "Eleven lizards leaping,\n" \
        "Ten wombats washing,\n" \
        "Nine crocs a-snoozing,\n" \
        "Eight dingoes dancing,\n" \
        "Seven emus laying,\n" \
        "Six sharks a-surfing,\n" \
        "Five kangaroos,\n" \
        "Four lyrebirds,\n" \
        "Three wet galahs,\n" \
        "Two snakes on skis,\n" \
        "And a kookaburra in a gum tree."
      )
    end

    it "returns the Twelve English verses of the song" do
      expect(described_class.new(locale: :en).verse(12)).to eq(
        "On the twelfth day of Christmas\n" \
        "My true love gave to me:\n" \
        "Twelve drummers drumming,\n" \
        "Eleven pipers piping,\n" \
        "Ten lords-a-leaping,\n" \
        "Nine ladies dancing,\n" \
        "Eight maids-a-milking,\n" \
        "Seven swans-a-swimming,\n" \
        "Six geese-a-laying,\n" \
        "Five gold rings,\n" \
        "Four calling birds,\n" \
        "Three french hens,\n" \
        "Two turtle doves,\n" \
        "And a partridge in a pear tree." \
      )
    end

    it "returns the whole song" do
      expect(described_class.new.song).to eq(
        <<~EO_SONG
        On the first day of Christmas
        My true love gave to me:
        A partridge in a pear tree.

        On the second day of Christmas
        My true love gave to me:
        Two turtle doves,
        And a partridge in a pear tree.

        On the third day of Christmas
        My true love gave to me:
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the fourth day of Christmas
        My true love gave to me:
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the fifth day of Christmas
        My true love gave to me:
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the sixth day of Christmas
        My true love gave to me:
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the seventh day of Christmas
        My true love gave to me:
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the eighth day of Christmas
        My true love gave to me:
        Eight maids-a-milking,
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the ninth day of Christmas
        My true love gave to me:
        Nine ladies dancing,
        Eight maids-a-milking,
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the tenth day of Christmas
        My true love gave to me:
        Ten lords-a-leaping,
        Nine ladies dancing,
        Eight maids-a-milking,
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the eleventh day of Christmas
        My true love gave to me:
        Eleven pipers piping,
        Ten lords-a-leaping,
        Nine ladies dancing,
        Eight maids-a-milking,
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        On the twelfth day of Christmas
        My true love gave to me:
        Twelve drummers drumming,
        Eleven pipers piping,
        Ten lords-a-leaping,
        Nine ladies dancing,
        Eight maids-a-milking,
        Seven swans-a-swimming,
        Six geese-a-laying,
        Five gold rings,
        Four calling birds,
        Three french hens,
        Two turtle doves,
        And a partridge in a pear tree.

        EO_SONG
      )
    end
  end
end
