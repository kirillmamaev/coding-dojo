.PHONY: help
help:
	@echo "make test-integration runs the integration tests only"
	@echo "make test-all runs all tests"

.PHONY: test-all
test-all:
	bundle exec rspec spec

.PHONY: test-integration
test-integration:
	bundle exec rspec spec/integration/bar_system_spec.rb
