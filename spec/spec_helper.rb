# frozen_string_literal: true

require 'bundler/setup'
require 'vamoos'
require 'webmock/rspec'
Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    stub_request(:any, /live.vamoos.com/).to_rack(FakeVamoos)
  end

  config.include Helpers::Authentication, type: :feature
end
