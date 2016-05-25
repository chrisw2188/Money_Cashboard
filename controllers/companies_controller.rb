require 'pry-byebug'
require_relative '../models/company'

get '/companies' do 
  @companies = Company.all
  erb (:'companies/index')
end

get '/companies/new' do
  erb (:'companies/new')
end

post '/companies' do
  @company = Company.new(params)
  @company.save
  erb :'companies/create'
end

get '/companies/:id' do
  @company = Company.find(params[:id])
  erb (:'companies/show')
end

get '/companies/:id/edit' do 
  @company =  Company.find(params[:id])
  erb (:'companies/edit')
end

put '/companies/:id' do
  @company = Company.update(params)
  redirect to ("/companies/#{params[:id]}")
end

delete '/companies/:id' do
Company.destroy(params[:id])
  redirect to ('/companies')
end