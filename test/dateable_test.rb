require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'

class DateableTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_generate_offsets_without_date_parameter
    date = nil
    assert_instance_of Array, @enigma.generate_offsets(date)
    assert_equal 4, @enigma.generate_offsets(date).length
    assert_equal Integer, @enigma.generate_offsets(date).first.class
    assert_equal Integer, @enigma.generate_offsets(date).last.class
  end

  def test_it_can_generate_offsets_with_sent_date_parameter
    date = '040895'
    assert_instance_of Array, @enigma.generate_offsets(date)
    assert_equal 4, @enigma.generate_offsets(date).length
    assert_equal Integer, @enigma.generate_offsets(date).first.class
    assert_equal Integer, @enigma.generate_offsets(date).last.class
    require 'pry'; binding.pry
  end

  def test_it_can_square_last_four_of_squared_date
    date = Time.now.strftime("%0e%0m%y")
    assert_instance_of String, @enigma.squared_date_last_four(date)
    assert_equal 4, @enigma.squared_date_last_four(date).length
    assert_equal Integer, @enigma.squared_date_last_four(date)[0].to_i.class
    assert_equal Integer, @enigma.squared_date_last_four(date)[-1].to_i.class

    date = '040895'
    assert_instance_of String, @enigma.squared_date_last_four(date)
    assert_equal 4, @enigma.squared_date_last_four(date).length
    assert_equal Integer, @enigma.squared_date_last_four(date)[0].to_i.class
    assert_equal Integer, @enigma.squared_date_last_four(date)[-1].to_i.class
  end

  def test_it_can_package_date
    date = Time.now.strftime("%0e%0m%y")
    assert_instance_of Array, @enigma.package_date(date)
    assert_equal 4, @enigma.package_date(date).length
    assert_equal Integer, @enigma.package_date(date).first.class

    date = '040895'
    assert_instance_of Array, @enigma.package_date(date)
    assert_equal 4, @enigma.package_date(date).length
    assert_equal Integer, @enigma.package_date(date).first.class
  end
end
