require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'

class KeyableTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_generate_new_key
    key = nil
    assert_instance_of Array, @enigma.generate_key
    assert_equal 4, @enigma.generate_key.length
    assert_equal Integer, @enigma.generate_key.first.class
  end

  def test_it_can_generate_key_pair
    assert_instance_of Array, @enigma.generate_key
    assert_equal 4, @enigma.generate_key.length
    assert_equal Integer, @enigma.generate_key.first.class
  end

  def test_it_can_package_sent_key
    created_key = '02715'
    assert_instance_of Array, @enigma.package_key(created_key)
    assert_equal 4, @enigma.package_key(created_key).length
    assert_equal [2, 27, 71, 15], @enigma.package_key(created_key)
  end
end
