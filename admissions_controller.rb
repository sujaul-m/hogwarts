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
