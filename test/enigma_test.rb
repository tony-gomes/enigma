require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_message_without_parameters
    message = 'Hello World!'
    assert @enigma.encrypt(message)
  end

  def test_it_can_decrypt_message_without_parameters
    skip
    cyphertext = 'keder ohulw'
    assert @enigma.decrypt(cyphertext)
  end
end
