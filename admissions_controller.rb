require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")

#HOMEPAGE
get "/" do
  erb(:homepage)
end


#INDEX ROUTE
get "/students" do
  @students = Student.all()
  erb(:index)
end

#INDEX ROUTE
get "/houses" do
  @houses = House.all
  erb(:index_house)
end


#NEW ROUTE
get "/students/new" do
  @houses = House.all
  erb(:new)
end


#CREATE ROUTE
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end


#EDIT ROUTE
get "/students/:id/edit" do
  @student = Student.find(params["id"])
  @houses = House.all
  erb(:edit)
end


#DELETE ROUTE
post "/students/:id/delete" do
  @student = Student.find(params["id"])
  @student.delete()
  redirect "/students"
end


#UPDATE ROUTE
post "/students/:id" do
  @student = Student.new(params)
  @student.update()
  erb(:update)
end


#SHOW ROUTE
get "/students/:id" do
  @student = Student.find(params["id"])
  erb(:show)
end

#SHOW ROUTE - HOUSE
get "/houses/:id/students" do
  @house = House.find(params["id"])
  @students = House.find_student(@house.id)
  erb(:show_students)
end
