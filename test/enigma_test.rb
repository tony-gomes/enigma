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

  def test_it_can_encrypt_message_with_parameters
    skip
    message = 'hello world'
    key = '02715'
    date = '040895'
    assert @enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt_message_without_parameters
    skip
    cyphertext = 'keder ohulw'
    assert @enigma.decrypt(cyphertext)
  end

  def test_it_can_decrypt_message_with_parameters
    skip
    cyphertext = 'keder ohulw'
    key = '02715'
    date = '040895'
    assert @enigma.decrypt(cyphertext, key, date)
  end
end
