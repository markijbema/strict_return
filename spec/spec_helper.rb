require 'rspec'
$LOAD_PATH << './lib/'
require 'strict_return'

RSpec.configure do |c|
  c.raise_errors_for_deprecations!
end
