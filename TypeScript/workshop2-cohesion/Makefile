.PHONY: select_tool setup_ruby create_tool_versions_file asdf_add_plugin asdf_install\
        create_gemfile bundle_install setup_node init_npm_project ruby_test \
				install_ts_&_jest create_tsconfig create_ts_test_config create_jest_config \
				config_npm_scripts creating_node_boilerplate node_test create_ruby_boilerplate \
				ruby_run node_run
default: select_tool

ruby_test:
	bundle exec rspec *_spec.rb

ruby_run:
	bundle exec ruby main.rb

node_test:
	npm test

node_run:
	npm run node dist/$(if $(FILE),$(FILE),example.js)

select_tool:
	@echo "Select a tool:"
	@echo "1. Ruby"
	@echo "2. TypeScript"
	@echo "3. I'll set it up myself"
	@read -p "Enter your choice (1/2/3): " choice; \
	case $$choice in \
		1)	echo "Ruby selected..."; \
				$(MAKE) setup_ruby; \
		;; \
		2)	echo "TypeScript selected..."; \
				$(MAKE) setup_node; \
		;;\
		3)	echo "Ok, you're on your own. Godspeed!"; \
		;; \
		*)	echo "Invalid choice. Please run 'make select_tool' again."; exit 1; \
		;; \
	esac;

setup_node: TOOL_VERSION="nodejs 24.4.1"
setup_node: LANGUAGE="nodejs"
setup_node: PLUGIN_URL="https://github.com/asdf-vm/asdf-nodejs.git"
setup_node: create_tool_versions_file asdf_add_plugin asdf_install init_npm_project \
install_ts_&_jest create_tsconfig create_ts_test_config create_jest_config config_npm_scripts \
creating_node_boilerplate
setup_node:
	@echo "Done! ✅ TypeScript with Jest environment is ready."; \
	echo "- Put your .ts files in the src/ directory"; \
	echo "- To build: npm run build"; \
	echo "- To run: npm run node dist/example.js"; \
	echo "- To test: npm test"; \


setup_ruby: TOOL_VERSION="ruby 3.3.6"
setup_ruby: LANGUAGE="ruby"
setup_ruby: PLUGIN_URL="https://github.com/asdf-vm/asdf-ruby.git"
setup_ruby: create_tool_versions_file asdf_add_plugin asdf_install create_gemfile bundle_install create_ruby_boilerplate

create_tool_versions_file:
	@if [ ! -f .tool-versions ]; then \
		echo "Creating .tool-versions file..."; \
		echo $(TOOL_VERSION) > .tool-versions; \
  else \
		echo ".tool-versions detected, skipping"; \
	fi

asdf_add_plugin:
	asdf plugin add $(LANGUAGE) $(PLUGIN_URL)

asdf_install:
	asdf install $(LANGUAGE)

create_gemfile:
	@if [ ! -f Gemfile ]; then \
		echo "Creating Gemfile..."; \
		echo "source 'https://rubygems.org' \n\ngem 'rspec'" > Gemfile; \
	else \
		echo "Gemfile detected, skipping"; \
	fi

bundle_install:
	bundle install

create_ruby_boilerplate:
	@if [ ! -f main.rb ]; then \
		echo "Creating ruby boilerplate..."; \
		echo "def main; puts \"Hello World!\";end\nmain" > main.rb; \
		echo "require 'rspec'\nrequire_relative 'main'\n\nRSpec.describe 'Main' do\n  it 'does nothing' do\n    expect { main }.to output(\"Hello World!\n\").to_stdout\n  end\nend\n" > main_spec.rb; \
	else \
		echo "boilerplate files detected, skipping"; \
	fi; \

init_npm_project:
	@if [ ! -f package.json ]; then \
		echo "Initializing npm project..."; \
		npm init -y > /dev/null; \
	else \
		echo "package.json detected, skipping"; \
	fi; \

install_ts_&_jest:
	@if [ ! -d node_modules/@types/node ]; then \
		echo "Installing TypeScript and Jest..."; \
		npm install --save-dev typescript jest @types/jest @types/node ts-jest @jest/globals > /dev/null 2>&1; \
	else \
		echo "TypeScript and Jest already installed, skipping"; \
	fi; \

create_tsconfig:
	@if [ ! -f tsconfig.json ]; then \
		echo "Creating tsconfig.json..."; \
		echo '{' > tsconfig.json; \
		echo '  "compilerOptions": {' >> tsconfig.json; \
		echo '    "target": "es2022",' >> tsconfig.json; \
		echo '    "module": "commonjs",' >> tsconfig.json; \
		echo '    "outDir": "./dist",' >> tsconfig.json; \
		echo '    "rootDir": "./src",' >> tsconfig.json; \
		echo '    "strict": true,' >> tsconfig.json; \
		echo '    "esModuleInterop": true,' >> tsconfig.json; \
		echo '    "skipLibCheck": true,' >> tsconfig.json; \
		echo '    "forceConsistentCasingInFileNames": true,' >> tsconfig.json; \
		echo '    "typeRoots": []' >> tsconfig.json; \
		echo '  },' >> tsconfig.json; \
		echo '  "include": ["src/**/*"],' >> tsconfig.json; \
		echo '  "exclude": ["node_modules", "dist", "**/*.test.ts"]' >> tsconfig.json; \
		echo '}' >> tsconfig.json; \
	else \
		echo "tsconfig.json detected, skipping"; \
	fi

create_ts_test_config:
	@if [ ! -f tsconfig.test.json ]; then \
		echo "Creating test tsconfig..."; \
		echo '{' > tsconfig.test.json; \
		echo '  "extends": "./tsconfig.json",' >> tsconfig.test.json; \
		echo '  "compilerOptions": {' >> tsconfig.test.json; \
		echo '    "typeRoots": ["node_modules/@types"]' >> tsconfig.test.json; \
		echo '  },' >> tsconfig.test.json; \
		echo '  "include": ["src/**/*"],' >> tsconfig.test.json; \
		echo '  "exclude": ["node_modules", "dist"]' >> tsconfig.test.json; \
		echo '}' >> tsconfig.test.json; \
	else \
		echo "tsconfig.test.json detected, skipping"; \
	fi

create_jest_config:
	@if [ ! -f jest.config.js ]; then \
		echo "Creating Jest configuration..."; \
		echo 'module.exports = {' > jest.config.js; \
		echo '  preset: "ts-jest",' >> jest.config.js; \
		echo '  testEnvironment: "node",' >> jest.config.js; \
		echo '  testMatch: ["**/src/**/*.test.ts"],' >> jest.config.js; \
		echo '  transform: {' >> jest.config.js; \
		echo '    "^.+\\\\.ts$$": ["ts-jest", { "tsconfig": "tsconfig.test.json" }]' >> jest.config.js; \
		echo '  }' >> jest.config.js; \
		echo '};' >> jest.config.js; \
	else \
		echo "jest.config.js detected, skipping"; \
	fi

config_npm_scripts:
	@echo "Configuring npm scripts..."; \
	npm pkg set scripts.build="tsc"; \
	npm pkg set scripts.test="jest"; \
	npm pkg set scripts.node="npm run build && node"; \

creating_node_boilerplate:
	@if [ ! -d src ]; then \
		echo "Creating src directory..."; \
		mkdir src; \
		echo "Creating example files..."; \
		echo 'export function foo(): void {' > src/example.ts; \
		echo '  console.log("bar");' >> src/example.ts; \
		echo '}' >> src/example.ts; \
		echo '' >> src/example.ts; \
		echo 'foo();' >> src/example.ts; \
		echo 'import { foo } from "./example";' > src/example.test.ts; \
		echo '' >> src/example.test.ts; \
		echo 'describe("foo", () => {' >> src/example.test.ts; \
		echo '  it("outputs \\"bar\\"", () => {' >> src/example.test.ts; \
		echo '    const consoleSpy = jest.spyOn(console, "log").mockImplementation();' >> src/example.test.ts; \
		echo '    foo();' >> src/example.test.ts; \
		echo '    expect(consoleSpy).toHaveBeenCalledWith("bar");' >> src/example.test.ts; \
		echo '    consoleSpy.mockRestore();' >> src/example.test.ts; \
		echo '  });' >> src/example.test.ts; \
		echo '});' >> src/example.test.ts; \
	else \
		echo "src directory detected, skipping"; \
	fi; \
