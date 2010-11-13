require File.dirname(__FILE__) + '/../lib/musix_match'

RSpec.configure do |config|
  def load_fixture(name)
    File.open(File.dirname(__FILE__) + "/fixtures/#{name}.json") do |file|
      JSON.parse(file.read)
    end
  end
end