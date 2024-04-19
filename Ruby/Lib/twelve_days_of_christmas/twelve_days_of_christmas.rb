module TwelveDaysOfChristmas
  class TwelveDaysOfChristmas
    def initialize(locale: :en)
      @locale = locale
    end

    def verse(number)
      if number == 1
        generate_verse_lines(number) +
        "A #{DICTIONARY[@locale][:gifts][1]}."
      elsif number == 2
        generate_verse_lines(number) +
        "Two #{DICTIONARY[@locale][:gifts][2]},\n" \
        "And a #{DICTIONARY[@locale][:gifts][1]}."
      elsif number == 3
        generate_verse_lines(number) +
        "Three #{DICTIONARY[@locale][:gifts][3]},\n" \
        "Two #{DICTIONARY[@locale][:gifts][2]},\n" \
        "And a #{DICTIONARY[@locale][:gifts][1]}."
      elsif number == 12
        generate_verse_lines(number) +
        "Twelve #{DICTIONARY[@locale][:gifts][12]},\n" \
        "Eleven #{DICTIONARY[@locale][:gifts][11]},\n" \
        "Ten #{DICTIONARY[@locale][:gifts][10]},\n" \
        "Nine #{DICTIONARY[@locale][:gifts][9]},\n" \
        "Eight #{DICTIONARY[@locale][:gifts][8]},\n" \
        "Seven #{DICTIONARY[@locale][:gifts][7]},\n" \
        "Six #{DICTIONARY[@locale][:gifts][6]},\n" \
        "Five #{DICTIONARY[@locale][:gifts][5]},\n" \
        "Four #{DICTIONARY[@locale][:gifts][4]},\n" \
        "Three #{DICTIONARY[@locale][:gifts][3]},\n" \
        "Two #{DICTIONARY[@locale][:gifts][2]},\n" \
        "And a #{DICTIONARY[@locale][:gifts][1]}."
      end
    end

    def generate_verse_lines(number)
      "On the #{LINE_NUMBER[number]} day of Christmas\n" \
      "My true love gave to me:\n" \
    end

    LINE_NUMBER = {
      0 => nil,
      1 => "first",
      2 => "second",
      3 => "third",
      4 => "fourth",
      5 => "fifth",
      6 => "sixth",
      7 => "seventh",
      8 => "eighth",
      9 => "ninth",
      10 => "tenth",
      11 => "eleventh",
      12 => "twelfth"
    }

    private

    DICTIONARY = {
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
  end
end
