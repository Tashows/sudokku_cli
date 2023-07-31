# frozen_string_literal: true

require_relative "lib/sudokku_cli/version"

Gem::Specification.new do |spec|
  spec.name = "sudokku_cli"
  spec.version = SudokkuCli::VERSION
  spec.authors = ["Tasos Maschalidis"]
  spec.email = ["tas.o.s@hotmail.com"]

  spec.summary = "A CLI program for logging in to Sudokku git server."
  spec.homepage = "https://github.com/Tashows/sudokku_cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Tashows/sudokku_cli"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "bin"
  spec.executables = ["sudokku"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "netrc"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "open-uri"
  spec.add_runtime_dependency "net-http"
  spec.add_runtime_dependency "dotenv"
  spec.add_runtime_dependency "launchy"
end
