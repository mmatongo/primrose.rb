require 'sinatra'
require_relative 'lib/primrose'  # Adjust this path to where your Primrose library is located

# Create a new store
store = Primrose::Store.new({todos: [{text: "Task 1", completed: false}, {text: "Task 2", completed: false}]})

helpers do
  include Primrose::Helpers
end

before do
  # Make the store available to routes
  @store = store
end

get '/' do
  @store.state.follow do |state|
    @todos = state[:todos]
  end
  erb :index
end

get '/about' do
  @store.state.follow do |state|
    @todos = state[:todos]
  end

  erb :about
end

post '/add_todo' do
  new_todo = { text: params[:new_todo], completed: false }
  puts "Adding new todo: #{new_todo}"
  @store.dispatch(
    type: 'ADD_TODO',
    updates: {
      todos: ->(todos) { todos + [new_todo] }  # Add 'new_todo' to todos
    }
  )
  redirect '/'
end

