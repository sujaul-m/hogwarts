require_relative('../models/student')

Student.delete_all()


gryffindor = House.new({
  "house_name" => "Gryffindor",
  "house_logo" => "https://www.pngfind.com/pngs/m/69-693437_gryffindor-crest-hd-png-download.png"
})

slytherin = House.new({
  "house_name" => "Slytherin",
  "house_logo" => "https://toppng.com/public/uploads/preview/harry-potter-slytherin-logo-11549535063t3nuppcxfd.png"
})

ravenclaw = House.new({
  "house_name" => "Ravenclaw",
  "house_logo" => "https://www.pinclipart.com/picdir/middle/113-1138734_crest-png-for-free-download-on-harry-potter.png"
})

hufflepuff = House.new({
  "house_name" => "Hufflepuff",
  "house_logo" => "https://www.pinclipart.com/picdir/middle/453-4537332_crest-banner-png-harry-potter-hufflepuff-crest-clipart.png"
})

gryffindor.save()
slytherin.save()
ravenclaw.save()
hufflepuff.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "age" => 11,
  "house_id" => gryffindor.id
})

student2 = Student.new({
  "first_name" => "Tom",
  "last_name" => "Riddle",
  "age" => 11,
  "house_id" => slytherin.id
})

student1.save
student2.save
