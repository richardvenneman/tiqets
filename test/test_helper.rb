$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# Coverage
require 'simplecov'
SimpleCov.start do
  add_group 'Libraries', 'lib'
end

# Source files
require 'tiqets'

# Framework
require 'minitest/autorun'
require 'webmock/minitest'

# Support
require 'support/webmock'
