class CrewMember < ApplicationRecord
  belongs_to :spaceship, optional: true

  validates :first_name, :last_name, presence: true
end
