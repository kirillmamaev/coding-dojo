# frozen_string_literal: true

module TwelveDaysOfChristmas
  class TwelveDaysOfChristmas
    DICTIONARY = {
      numbers: [
        nil,
        nil,
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine",
        "Ten",
        "Eleven",
        "Twelve"
      ],
      numerals: [
        nil,
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
        "eleventh",
        "twelfth"
      ],
      en: {
        gifts: [
          nil,
          "partridge in a pear tree",
          "turtle doves",
          "french hens",
          "calling birds",
          "gold rings",
          "geese-a-laying",
          "swans-a-swimming",
          "maids-a-milking",
          "ladies dancing",
          "lords-a-leaping",
          "pipers piping",
          "drummers drumming"
        ]
      },
      en_au: {
        gifts: [
          nil,
          "kookaburra in a gum tree",
          "snakes on skis",
          "wet galahs",
          "lyrebirds",
          "kangaroos",
          "sharks a-surfing",
          "emus laying",
          "dingoes dancing",
          "crocs a-snoozing",
          "wombats washing",
          "lizards leaping",
          "possums playing"
        ]
      }
    }

    def initialize(locale: :en)
      @locale = locale
    end

    def verse(number)
      output = generate_starting_verse_lines(number)
      (number..2).step(-1).each do |i|
        output += "#{DICTIONARY[:numbers][i]} #{DICTIONARY[@locale][:gifts][i]},\n" \
      end
      output +=
        ((number == 1) ? "A " : "And a ") +
        "#{DICTIONARY[@locale][:gifts][1]}."
    end

    def song
      output = ''
      (1..12).each do |i|
        output += verse(i) + "\n\n"
      end
      output
    end

    private

    def generate_starting_verse_lines(number)
      "On the #{DICTIONARY[:numerals][number]} day of Christmas\n" \
      "My true love gave to me:\n" \
    end
  end
end
