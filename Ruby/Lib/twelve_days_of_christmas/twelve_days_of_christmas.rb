# frozen_string_literal: true

require 'twelve_days_of_christmas/dictionary'

module TwelveDaysOfChristmas
  class SongGenerator
    FIRST_DAY = 1
    LAST_DAY = 12
    COMMA =","
    DOT = "."
    EOL = "\n"

    def initialize(locale: :en)
      @locale = locale
    end

    def song
      (FIRST_DAY..LAST_DAY).map do |day|
        "#{verse(day)}" +
        "#{((day == LAST_DAY) ? "" : "#{EOL}")}"
      end.join
    end

    def verse(day_number)
      output = capitalize("#{DICTIONARY[@locale][:days_of_christmas_line][day_number]}#{EOL}")
      output += capitalize("#{DICTIONARY[@locale][:present_giver_line]}#{EOL}")

      day_number.downto(2) do |gift_number|
        output += capitalize("#{DICTIONARY[@locale][:gifts][gift_number]}#{COMMA}#{EOL}")
      end

      output += capitalize(
        ((day_number == 1) ? "" : "#{DICTIONARY[@locale][:conjunction]} ") +
        "#{DICTIONARY[@locale][:gifts][1]}#{DOT}#{EOL}"
      )
    end

    private

    def capitalize(string)
      "#{string[0].upcase}#{string[1..-1]}"
    end
  end
end
