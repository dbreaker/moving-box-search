# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
MoveSize.create(:home_size => "Room or Partial Room", :pounds => 1000)
MoveSize.create(:home_size => "Studio",  :pounds =>  1500)
MoveSize.create(  :home_size => "Small 1 Bedroom",  :pounds =>  3000)
MoveSize.create(:home_size => "Large 1 Bedroom",  :pounds =>  4000)
MoveSize.create(:home_size => "Small 2 Bedroom",  :pounds =>  4500)
MoveSize.create(  :home_size => "Large 2 Bedroom",  :pounds =>  6500)
MoveSize.create(  :home_size => "Small 3 Bedroom",  :pounds =>  8000)
MoveSize.create(  :home_size => "Large 3 Bedroom",  :pounds =>  9000)
MoveSize.create(  :home_size => "Small 4 Bedroom",  :pounds =>  10000)
MoveSize.create(  :home_size => "Large 4 Bedroom",  :pounds =>  12000)
MoveSize.create(  :home_size => "5 or more Bedrooms",  :pounds =>  13000)
