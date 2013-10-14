# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ACTION_TYPES = {
  main: 'Главная', 
  left: 'Акция слева у карты', 
  bottom1: 'Нижняя первая', 
  bottom2: 'Нижняя вторая',
  vacancy: 'Вакансии'
}

puts "==  Deleting all rows in actiontypes table  =="
ActionType.destroy_all
puts "==  Done.  ==================================="

puts "==  Deleting all rows in actions table  =="
Action.destroy_all
puts "==  Done.  ==================================="

puts "==  Creating actiontypes.  ==================="
ACTION_TYPES.each do |k,v|
  ActionType.create(text: k, title: v)
end
puts "==  Done.  ==================================="
