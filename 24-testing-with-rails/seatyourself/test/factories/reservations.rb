FactoryGirl.define do
  factory :reservation do
    party_size { rand(5..25) }
    time       { Time.now }
  end
end
