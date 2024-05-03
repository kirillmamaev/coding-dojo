# frozen_string_literal: true

require 'twelve_days_of_christmas/dictionary'

module TwelveDaysOfChristmas
  class SongGenerator
    FIRST_DAY = 1
    SECOND_DAY = 2
    LAST_DAY = 12
    COMMA =","
    DOT = "."
    EOL = "\n"

    attr_reader :locale

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
      return "#{output}#{capitalize(DICTIONARY[@locale][:gifts][FIRST_DAY])}#{DOT}#{EOL}" if day_number == FIRST_DAY

      day_number.downto(SECOND_DAY) do |gift_number|
        output += capitalize("#{DICTIONARY[@locale][:gifts][gift_number]}#{COMMA}#{EOL}")
      end

      output + "#{capitalize(
          "#{DICTIONARY[locale][:conjunction]} #{DICTIONARY[locale][:gifts][FIRST_DAY]}"
        )}#{DOT}#{EOL}"
    end

    private

    def capitalize(string)
      "#{string[0].upcase}#{string[1..-1]}"
    end
  end
end
