require 'minitest/autorun'
require 'minitest/emoji'
require './lib/encryption'
require './lib/enigma'

class EncryptionTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
    message = 'Hello World!'
    @encryption = @enigma.encrypt_message(message)
  end

  def test_it_exists
    assert @encryption
  end
end
