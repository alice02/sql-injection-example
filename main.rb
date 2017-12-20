require "sinatra"
require "sqlite3"


db = SQLite3::Database.new "sample.db"
db.results_as_hash = true
db.execute("drop table if exists users;")
db.execute("create table users (id integer primary key autoincrement, name varchar(255), email varchar(255), password varchar(255));")
db.execute("insert into users (name, email, password) values ('name1', 'hoge1@gmail.com', 'pass1'), ('name2', 'hoge2@gmail.com', 'pass2'), ('name3', 'hoge3@gmail.com', 'pass3');")


get "/" do
  erb :index
end

post "/login" do
  name = params[:name]
  password = params[:password]
  @query = "select * from users where name = \"#{name}\" and password = \"#{password}\";"
  @user = db.execute(@query)
  erb :login
end
