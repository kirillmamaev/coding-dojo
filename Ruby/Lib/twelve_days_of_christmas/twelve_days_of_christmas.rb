# frozen_string_literal: true

require "twelve_days_of_christmas/dictionary"

module TwelveDaysOfChristmas
  # Generator for the song "The Twelve Days of Christmas"
  class SongGenerator
    FIRST_DAY = 1
    SECOND_DAY = 2
    LAST_DAY = 12
    COMMA = ","
    DOT = "."
    EOL = "\n"

    attr_reader :locale

    # Initialize the SongGenerator and sets the environment variable @locale
    def initialize(locale: :en)
      @locale = locale
    end

    # Generate the full song
    def song
      song_verses = []
      (FIRST_DAY..LAST_DAY).each do |day_number|
        song_verses.push(verse(day_number))
      end
      song_verses.join(EOL * 2)
    end

    # Generate a verse of the song
    def verse(day_number)
      verse_lines = []
      verse_lines.push([
        capitalize(DICTIONARY[@locale][:preposition]),
        DICTIONARY[@locale][:definite_article],
        DICTIONARY[@locale][:numerals][day_number],
        DICTIONARY[@locale][:day_of_christmas],
      ].join(" "))
      verse_lines.push(capitalize(DICTIONARY[@locale][:present_giver_line]))

      day_number.downto(SECOND_DAY) do |gift_number|
        verse_lines.push([
          capitalize(DICTIONARY[@locale][:gifts][gift_number]),
          COMMA
        ].join)
      end

      if day_number == FIRST_DAY
        verse_lines.push([
          capitalize(DICTIONARY[@locale][:gifts][FIRST_DAY]),
          DOT
        ].join)
      else
        verse_lines.push([
          capitalize(DICTIONARY[locale][:conjunction]),
          " ",
          DICTIONARY[locale][:gifts][FIRST_DAY],
          DOT
        ].join)
      end

      verse_lines.join(EOL)
    end

    private

    # Capitalize the first letter of a string
    def capitalize(string)
      "#{string[0].upcase}#{string[1..]}"
    end
  end
end
