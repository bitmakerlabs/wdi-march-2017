FactoryGirl.define do

  factory :restaurant do
    name     { ['Swiss Chalet', 'Burger Priest', 'Shawarma King'].sample }
    address  { ['22 King St', '44 Yonge St', '92 Queen St' ].sample }
    capacity { rand(5..100) }
  end

end
