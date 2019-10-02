require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/student")
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

#CREATE ROUTE
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

#NEW ROUTE
get "/students/new" do
  erb(:new)
end

#SHOW ROUTE
get "/students/:id" do
  @student = Student.find(params["id"])
  erb(:show)
end
