.DEFAULT_GOAL := usage

.PHONY: install
install:
	brew update && brew install modularml/packages/modular
	python3 -m venv mojo-venv && source mojo-venv/bin/activate
	modular install mojo

.PHONY: update
update:
	brew update && brew upgrade modular
	modular update mojo

.PHONY: build-hello
build-hello:
	mkdir -p build
	mojo build -o build/hello hello.mojo

.PHONY: run-hello
run-hello:
	mojo hello.mojo
