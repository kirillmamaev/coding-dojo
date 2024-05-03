.DEFAULT_GOAL := usage

.PHONY: build
build: install lint test

.PHONY: install
install:
	bundle install

.PHONY: test
test:
	bundle exec rspec --format documentation

.PHONY: test-twelve_days
test-twelve_days:
	bundle exec rspec --format documentation spec/twelve_days_of_christmas

.PHONY: lint
lint:
	bundle exec rubocop

.PHONY: lint-fix
lint-fix:
	bundle exec rubocop --autocorrect-all

.PHONY: demo
demo:
	ruby -I lib -e 'require "main"; puts Main.print_message'

.PHONY: demo-twelve_days
demo-twelve_days:
	@ruby -I lib -e 'require "twelve_days_of_christmas/twelve_days_of_christmas"; \
		puts "🇬🇧\n" + TwelveDaysOfChristmas::SongGenerator.new.song'
	ruby -I lib -e 'require "twelve_days_of_christmas/twelve_days_of_christmas"; \
		puts "🦘\n" + TwelveDaysOfChristmas::SongGenerator.new(locale: :en_au).song'

.PHONY: usage
usage:
	@echo "make build                  to install, lint and test"
	@echo "make test                   to run rspec"
	@echo "make lint                   to run rubocop"
	@echo "make lint-fix               to rubocop autocorrect-all"
	@echo
	@echo "make demo                   to execute the code"
