class Spaceship < ApplicationRecord
  has_many :crew_members

  accepts_nested_attributes_for :crew_members, allow_destroy: true

  validates_presence_of :name

  # NOTE: This is what accepts_nested_attributes_for does (roughly)!
  # def crew_members_attributes=(params)
  #   params.each do |crew_member_params|
  #     if crew_member_params["_destroy"]
  #       # destroy instead of create
  #     else
  #       new_crew_member = CrewMember.new(crew_member_params)
  #       new_crew_member.spaceship = self
  #       new_crew_member.save
  #     end
  #   end
  # end
end
