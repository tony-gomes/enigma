require './lib/encryption'

class Enigma
  def encrypt(message, key = nil, date = nil)
    generate_key(key)
    generate_date(date)
    encryption = Encryption.new(message, key, date)

    {
      encryption: encryption.encrypt_message(message),
      key: final_key,
      date: final_date
    }
  end

  def decrypt(ciphertext, key = nil, date = nil)
  end
end
