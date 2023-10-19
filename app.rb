require 'sinatra'
require_relative 'lib/primrose'  # Adjust this path to where your Primrose library is located

# Create a new store
store = Primrose::Store.new({todos: ["Task 1", "Task 2"]})

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

post '/add_todo' do
  new_todo = params[:new_todo]
  puts "Adding new todo: #{new_todo}"
  @store.dispatch(
    type: 'ADD_TODO',
    updates: {
      todos: ->(todos) { todos + [new_todo] }  # Add 'new_todo' to todos
    }
  )
  redirect '/'
end

