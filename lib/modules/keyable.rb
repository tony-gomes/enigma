module Keyable
  def package_key(key)
    key_array = [key[0..1], key[1..2], key[2..3], key[3..4]]
    key_array.map(&:to_i)
  end

  def generate_key_pair
    random_double_digit = [rand(9), rand(9)].join
    random_double_digit until random_double_digit.length == 2
    random_double_digit.to_i
  end

  def generate_key_gen
    [rand(9), rand(9), rand(9), rand(9), rand(9)].join
  end

  def generate_key
    key = generate_key_gen
    keys = {}
    keys[:key] = key
    keys[:key_package] = package_key(key)
    keys
  end
end
