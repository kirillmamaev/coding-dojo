.PHONY: select_tool

select_tool:
	@echo "Select a tool:"
	@echo "1. Ruby"
	@echo "2. TypeScript"
	@echo "3. I'll set it up myself"
	@read -p "Enter your choice (1/2/3): " choice; \
	case $$choice in \
		1) echo "Ruby selected..."; \
		   echo "Creating .tool-versions file..."; \
       echo "ruby 3.3.6" > .tool-versions; \
		   echo "Installing Ruby..."; \
	     asdf install ruby; \
		   echo "Creating Gemfile..."; \
		   echo "source 'https://rubygems.org' \n\ngem 'rspec'" > Gemfile; \
		   echo "Installing gems..."; \
		   bundle install; \
		   echo "Done! ✅"; \
		;; \
    2) echo "TypeScript selected..."; \
       echo "nodejs 24.4.1" > .tool-versions; \
       asdf install nodejs; \
       echo "Initializing npm project..."; \
       npm init -y > /dev/null; \
       echo "Installing TypeScript and Jest..."; \
       npm install --save-dev typescript jest @types/jest @types/node ts-jest > /dev/null 2>&1; \
       echo "Creating tsconfig.json..."; \
       rm -f tsconfig.json tsconfig.test.json jest.config.js; \
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
       echo "Creating test tsconfig..."; \
       echo '{' > tsconfig.test.json; \
       echo '  "extends": "./tsconfig.json",' >> tsconfig.test.json; \
       echo '  "compilerOptions": {' >> tsconfig.test.json; \
       echo '    "typeRoots": ["node_modules/@types"]' >> tsconfig.test.json; \
       echo '  },' >> tsconfig.test.json; \
       echo '  "include": ["src/**/*"],' >> tsconfig.test.json; \
       echo '  "exclude": ["node_modules", "dist"]' >> tsconfig.test.json; \
       echo '}' >> tsconfig.test.json; \
       echo "Creating Jest configuration..."; \
       echo 'module.exports = {' > jest.config.js; \
       echo '  preset: "ts-jest",' >> jest.config.js; \
       echo '  testEnvironment: "node",' >> jest.config.js; \
       echo '  testMatch: ["**/src/**/*.test.ts"],' >> jest.config.js; \
       echo '  transform: {' >> jest.config.js; \
       echo '    "^.+\\\\.ts$$": ["ts-jest", { "tsconfig": "tsconfig.test.json" }]' >> jest.config.js; \
       echo '  }' >> jest.config.js; \
       echo '};' >> jest.config.js; \
       echo "Configuring npm scripts..."; \
       npm pkg set scripts.build="tsc"; \
       npm pkg set scripts.test="jest"; \
       npm pkg set scripts.node="npm run build && node"; \
       echo "Creating src directory..."; \
       mkdir -p src; \
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
       echo "Done! ✅ TypeScript with Jest environment is ready."; \
       echo "- Put your .ts files in the src/ directory"; \
       echo "- To build: npm run build"; \
       echo "- To run: npm run node dist/example.js"; \
       echo "- To test: npm test"; \
		;; \
		3) echo "Ok"; \
		;; \
		*) echo "Invalid choice. Please run 'make select_tool' again."; exit 1; \
	esac
