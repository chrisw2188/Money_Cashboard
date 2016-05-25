require 'pry-byebug'
require_relative '../models/type'

get '/types' do 
  @types = Type.all
  erb (:'types/index')
end

get '/types/new' do
  erb (:'types/new')
end

post '/types' do
  @type = Type.new(params)
  @type.save
  redirect to ('/types')
end

get '/types/:id' do
  @type = Type.find(params[:id])
  erb (:'types/show')
end

get '/types/:id/edit' do 
  @type =  Type.find(params[:id])
  erb (:'types/edit')
end

put '/types/:id' do
  @type = Type.update(params)
  redirect to ("/types/#{params[:id]}")
end

delete '/types/:id' do
Type.destroy(params[:id])
  redirect to ('/types')
end