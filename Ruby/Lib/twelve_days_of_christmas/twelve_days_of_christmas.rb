# frozen_string_literal: true

require 'twelve_days_of_christmas/dictionary'

module TwelveDaysOfChristmas
  class SongGenerator
    FIRST_DAY = 1
    LAST_DAY = 12
    EOL = "\n"

    def initialize(locale: :en)
      @locale = locale
    end

    def verse(day_number)
      output = capitalize("#{DICTIONARY[@locale][:days_of_christmas_line][day_number]}#{EOL}")
      output += capitalize("#{DICTIONARY[@locale][:present_giver_line]}#{EOL}")

      day_number.downto(2) do |gift_number|
        output += capitalize("#{DICTIONARY[@locale][:gifts][gift_number]},#{EOL}")
      end

      output += capitalize(
        ((day_number == 1) ? "" : "#{DICTIONARY[@locale][:conjunction]} ") +
        "#{DICTIONARY[@locale][:gifts][1]}.#{EOL}"
      )
    end

    def song
      output = ''
      (1..12).each do |i|
        output += "#{verse(i)}#{((i == 12) ? "" : "#{EOL}")}"
      end
      output
    end

    private

    def capitalize(string)
      "#{string[0].upcase}#{string[1..-1]}"
    end
  end
end
