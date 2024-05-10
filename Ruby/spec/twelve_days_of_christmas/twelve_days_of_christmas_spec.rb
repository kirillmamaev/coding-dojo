# frozen_string_literal: true

require "spec_helper"
require "twelve_days_of_christmas/twelve_days_of_christmas"
require "twelve_days_of_christmas/dictionary"

module TwelveDaysOfChristmas
  RSpec.describe SongGenerator do
    before(:all) do
      @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN = File.read(
        File.join(
          File.dirname(__FILE__), "twelve_days_of_shristmas_en.txt"
        )
      ).freeze

      @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU = File.read(
        File.join(
          File.dirname(__FILE__), "twelve_days_of_christmas_en_au.txt"
        )
      ).freeze
    end

    it "returns the first verse of the english song" do
      expect(described_class.new(locale: :en).verse(1)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN.split("\n\n")[0] +
        "\n"
      )
    end

    it "returns the first verse of the aussie song" do
      expect(described_class.new(locale: :en_au).verse(1)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU.split("\n\n")[0] +
         "\n"
      )
    end

    it "returns the second verse of the english song" do
      expect(described_class.new(locale: :en).verse(2)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN.split("\n\n")[1] +
        "\n"
      )
    end

    it "returns the second verse of the aussie song" do
      expect(described_class.new(locale: :en_au).verse(2)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU.split("\n\n")[1] +
        "\n"
      )
    end

    it "returns the third verse of the english song" do
      expect(described_class.new(locale: :en).verse(3)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN.split("\n\n")[2] +
        "\n"
      )
    end

    it "returns the third verse of the aussie song" do
      expect(described_class.new(locale: :en_au).verse(3)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU.split("\n\n")[2] +
        "\n"
      )
    end

    it "returns the twelves verse of the english song" do
      expect(described_class.new(locale: :en).verse(12)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN.split("\n\n")[11]
      )
    end

    it "returns the twelves verse of the aussie song" do
      expect(described_class.new(locale: :en_au).verse(12)).to eq(
        @TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU.split("\n\n")[11]
      )
    end

    it "returns the whole classic english song" do
      expect(described_class.new(locale: :en).song).to eq(@TWELVE_DAYS_OF_CHRISTMAS_SONG_EN)
    end

    it "returns the whole classic aussie song" do
      expect(described_class.new(locale: :en_au).song).to eq(@TWELVE_DAYS_OF_CHRISTMAS_SONG_EN_AU)
    end
  end
end
