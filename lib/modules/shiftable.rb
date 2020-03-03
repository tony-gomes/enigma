module Shiftable
  def package_cyphertext(cyphertext, key, date)
      {
        encryption: cyphertext,
        key: key.join(''),
        date: date.join('')
      }
  end

  def package_message(message, key, date)
    {
      decryption: message,
      key: key.join(''),
      date: date.join('')
    }
  end

  def shift_characters(message, shift)
    guard_set = (('a'..'z').to_a << ' ')

    draft = message.each_with_index.reduce('') do |cyphertext, (character, index)|
      if guard_set.include?(character)
        cyphertext << character.tr(guard_set.to_s, guard_set.rotate(shift[:A]).to_s) if index % 4 == 0
        cyphertext << character.tr(guard_set.to_s, guard_set.rotate(shift[:B]).to_s) if index % 4 == 1
        cyphertext << character.tr(guard_set.to_s, guard_set.rotate(shift[:C]).to_s) if index % 4 == 2
        cyphertext << character.tr(guard_set.to_s, guard_set.rotate(shift[:D]).to_s) if index % 4 == 3
      else
        cyphertext << character
      end
      cyphertext
    end
  end

  def generate_shift_hash(key, date)
    shift_hash = {
      A: (key[0] + date[0]),
      B: (key[1] + date[1]),
      C: (key[2] + date[2]),
      D: (key[3] + date[3])
    }

    shift_hash
  end

  def message_shift(message, key, date)
    shift = generate_shift_hash(key, date)
    message_array = message.downcase.split('')
    shift_characters(message_array, shift)
  end

  def message_unshift(cyphertext, key, date)
    shift = generate_shift_hash(key, date)
    unshift = shift.transform_values { |value| value * -1 }
    cyphertext_array = cyphertext.downcase.split('')
    shift_characters(cyphertext_array, unshift)
  end
end
