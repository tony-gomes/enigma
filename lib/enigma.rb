require './lib/modules/keyable'
require './lib/modules/dateable'
require './lib/modules/shiftable'

class Enigma
  include Keyable
  include Dateable
  include Shiftable

  def initialize
    @message = nil,
    @key = nil,
    @date = nil
  end

  def encrypt(message, key = nil, date = nil)
    @origin_message = message
    key.nil? ? @key = generate_key(key) : package_key(key)
    @date = generate_offsets(date)

    message_shift(@origin_message, @key, @date)
    package_cyphertext(cyphertext, key, date)
  end

  def decrypt(ciphertext, key = nil, date = nil)
  end
end
