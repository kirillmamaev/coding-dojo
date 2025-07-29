.PHONY: install
install:
	asdf --version || echo "Please install ASDF"
	asdf plugin list --urls \
	| grep "https://github.com/asdf-vm/asdf-ruby.git" \
	|| asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf install
	bundle
