require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'

class ShiftableTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_shift_message
    message = 'Hello World!'
    key = [02, 27, 71, 15]
    date = [1, 0, 2, 5]
    assert_equal "keder ohulw!", @enigma.message_shift(message, key, date)
  end

  def test_it_can_unshift_message
    # message2 = 'keder ohulw!'
    # key2 = [02, 27, 71, 15]
    # date2 = [1, 0, 2, 5]

    # assert_equal 'hello world!', @enigma.message_unshift(message2, key2, date2)
  end

  def test_it_can_get_packaged_cryptions
    message = 'Hello World!'
    key = [02, 27, 71, 15]
    date = [1, 0, 2, 5]
    cyphertext = @enigma.message_shift(message, key, date)

    encryption = {
      encryption: 'keder ohulw!',
      key: key,
      date: date
    }

    require 'pry'; binding.pry
    assert @enigma.package_cyphertext(cyphertext, key, date)

    # decryption = {
    #   decryption: 'hello world!',
    #   key: key,
    #   date: date
    # }

    # assert @enigma.message_unshift(cyphertext, key, date)

  end
end
