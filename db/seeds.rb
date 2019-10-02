require_relative('../models/student')

Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "age" => 11,
  "house" => "Gryffindor"
})

student2 = Student.new({
  "first_name" => "Tom",
  "last_name" => "Riddle",
  "age" => 11,
  "house" => "Slytherin"
})

student1.save
student2.save
