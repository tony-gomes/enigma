require './lib/modules/keyable'
require './lib/modules/dateable'
require './lib/modules/shiftable'

class Enigma
  include Keyable
  include Dateable
  include Shiftable

  def initialize
    @key = nil,
    @date = nil
  end

  def encrypt(message, key = nil, date = nil)
    if key.nil?
      @key = generate_key[:key]
      key_package = generate_key[:key_package]
    else
      @key = key
      key_package = package_key(key)
    end

    date.nil? ? @date = Time.now.strftime("%0e%0m%y") : @date = date
    offset = generate_offsets(@date)

    cyphertext = message_shift(message, key_package, offset)
    package_cyphertext(cyphertext, @key, @date)
  end

  def decrypt(cyphertext, key = nil, date = nil)
    if key.nil?
      @key = generate_key[:key]
      key_package = generate_key[:key_package]
    else
      @key = key
      key_package = package_key(key)
    end

    date.nil? ? @date = Time.now.strftime("%0e%0m%y") : @date = date
    offset = generate_offsets(@date)

    message = message_unshift(cyphertext, key_package, offset)
    package_message(message, @key, @date)
  end
end
