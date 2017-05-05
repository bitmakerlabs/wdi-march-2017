class Tweet < ApplicationRecord
  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['consumer_key']
    config.consumer_secret     = ENV['consumer_secret']
    config.access_token        = ENV['access_token']
    config.access_token_secret = ENV['access_token_secret']
  end


  def self.search(term)
    CLIENT.search(term).take(5)
  end

  # def client
  #   @client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = "A7zzQfGRj0wIvmLW6VDAXvJSz"
  #     config.consumer_secret     = "qigHDXzQ42mSh5G4JIvhJerVL0hjt8GnxobJUA3JuQokUAw3yF"
  #     config.access_token        = "43390573-BRxv5tZfbRFOpT0mBmHczY9p8LOTrQJKvb7isyP06"
  #     config.access_token_secret = "zGDPikfIMpdVI5KD1MT0mzKRqmQmES0MdwyPDuIGsznk4"
  #   end
  # end
end
