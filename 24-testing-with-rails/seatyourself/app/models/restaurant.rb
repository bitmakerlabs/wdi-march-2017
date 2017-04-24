class Restaurant < ApplicationRecord

  has_many :reservations

  def available?(party_size, time)
    party_size > 0 && available_capacity(time) >= party_size
  end

  private

  def available_capacity(time)
    capacity - reservations_at(time).sum(:party_size)
  end

  def reservations_at(time)
    reservations.where(time: time.beginning_of_hour..time.end_of_hour)
  end

end
