# frozen_string_literal: true

module TwelveDaysOfChristmas
  class TwelveDaysOfChristmas
    def initialize(locale: :en)
      @locale = locale
    end

    def song
      (1..12).map { |number| verse(number) }.join("\n")
    end

    def verse(number)
      case number
      when 1
        generate_first_two_lines_of_verse(number) +
          "A #{GIFTS[@locale][1]}."
      when 2
        generate_first_two_lines_of_verse(number) +
          "Two #{GIFTS[@locale][2]},\n" \
          "And a #{GIFTS[@locale][1]}."
      when 3
        generate_first_two_lines_of_verse(number) +
          "Three #{GIFTS[@locale][3]},\n" \
          "Two #{GIFTS[@locale][2]},\n" \
          "And a #{GIFTS[@locale][1]}."
      when 12
        generate_first_two_lines_of_verse(number) +
          "Twelve #{GIFTS[@locale][12]},\n" \
          "Eleven #{GIFTS[@locale][11]},\n" \
          "Ten #{GIFTS[@locale][10]},\n" \
          "Nine #{GIFTS[@locale][9]},\n" \
          "Eight #{GIFTS[@locale][8]},\n" \
          "Seven #{GIFTS[@locale][7]},\n" \
          "Six #{GIFTS[@locale][6]},\n" \
          "Five #{GIFTS[@locale][5]},\n" \
          "Four #{GIFTS[@locale][4]},\n" \
          "Three #{GIFTS[@locale][3]},\n" \
          "Two #{GIFTS[@locale][2]},\n" \
          "And a #{GIFTS[@locale][1]}."
      end
    end

    def generate_first_two_lines_of_verse(number)
      "On the #{NUMERALS[number]} day of Christmas\n" \
      "My true love gave to me:\n" \
    end

    NUMERALS = [nil, "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

    GIFTS = {
      en: [
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
      ],
      en_au: [
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
  end
end
