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

    assert_instance_of Hash, @enigma.encrypt(message)
    assert_equal 3, @enigma.encrypt(message).count
    assert @enigma.encrypt(message).has_key?(:encryption)
    assert @enigma.encrypt(message).has_key?(:key)
    assert @enigma.encrypt(message).has_key?(:date)
  end

  def test_it_can_encrypt_message_with_parameters
    message = 'hello world'
    key = '02715'
    date = '040895'

    encryption = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal encryption, @enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt_message_without_parameters
    cyphertext = 'keder ohulw'

    assert_instance_of Hash, @enigma.decrypt(cyphertext)
    assert_equal 3, @enigma.decrypt(cyphertext).count
    assert @enigma.decrypt(cyphertext).has_key?(:decryption)
    assert @enigma.decrypt(cyphertext).has_key?(:key)
    assert @enigma.decrypt(cyphertext).has_key?(:date)
    assert @enigma.decrypt(cyphertext)
  end

  def test_it_can_decrypt_message_with_parameters
    cyphertext = 'keder ohulw'
    key = '02715'
    date = '040895'

    decryption = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal decryption, @enigma.decrypt(cyphertext, key, date)
  end
end
