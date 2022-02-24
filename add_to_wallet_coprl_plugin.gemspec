# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'add_to_wallet_coprl_plugin'
  spec.version = '0.1.0'
  spec.authors = ['Nick Miller']
  spec.email = ['nick@nmiller.info']

  spec.summary = 'COPRL plugin for adding items to digital wallets'
  spec.homepage = 'https://github.com/jadefish/add_to_wallet_coprl_plugin'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5.3' # rubocop:disable Gemspec/RequiredRubyVersion

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      # rubocop:disable Layout/LineLength
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
      # rubocop:enable Layout/LineLength
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rubocop', '~> 1.23'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.add_runtime_dependency 'coprl' # pulled in via Gemfile since it's a GitHub repo
end
