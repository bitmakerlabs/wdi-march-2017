class Restaurant < ApplicationRecord

  def available?(party_size)
    party_size > 0 && capacity >= party_size
  end

end
