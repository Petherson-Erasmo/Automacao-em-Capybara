require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # eu estou incluindo a DSL do capybara que são todos os metodos, funções e recursos do capybara 
  # dentro do rspec isso vai ficar conhecido dentro dos arquivos spec
  config.include Capybara::DSL
end

# Na linha a baixo eu informo que eu vou usar o selenium no google chrome
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end