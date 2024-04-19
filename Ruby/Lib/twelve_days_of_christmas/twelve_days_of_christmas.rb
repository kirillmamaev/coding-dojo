module TwelveDaysOfChristmas
  class TwelveDaysOfChristmas
    def initialize(locale: :en)
      @locale = locale
    end
    
    def verse(number)
      if number == 1
        "On the first day of Christmas/n" \
        "My true love gave to me:/n" \
        "A #{DICTIONARY[@locale][:gifts][1]}."
      elsif number == 2
        "On the second day of Christmas/n" \
        "My true love gave to me:/n" \
        "Two turtle doves,/n" \
        "And a #{DICTIONARY[@locale][:gifts][1]}."
      else
        "On the third day of Christmas/n" \
        "My true love gave to me:/n" \
        "Three french hens,/n" \
        "Two turtle doves,/n" \
        "And a #{DICTIONARY[@locale][:gifts][1]}."
      end
    end

    private

    DICTIONARY = {
      en: {
        gifts: [
          nil,
          "partridge in a pear tree"
        ]
      },
      en_au: {
        gifts: [
          nil,
          "kookaburra in a gum tree"
        ]
      }
    }
  end
end
