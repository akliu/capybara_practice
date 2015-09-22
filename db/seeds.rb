# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do
  FactoryGirl::create(:user)
end

50.times do
  FactoryGirl::create(:goal)
end

50.times do
  FactoryGirl::create(:goal_comment)
end

150.times do
  FactoryGirl::create(:user_comment)
end
