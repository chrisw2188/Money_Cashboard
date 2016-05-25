
require_relative '../models/transaction.rb'
require_relative '../models/company.rb'
require_relative '../models/type.rb'
require 'pry-byebug'

get '/transactions' do 
  @transactions = Transaction.all
  erb (:'transactions/index')
end

get '/transactions/new' do
  @transaction = Transaction.all.last
  @companies = Company.all
  @types = Type.all
  erb (:'transactions/new')
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transactions = Transaction.all
  @transaction.save 
  redirect to 'transactions/new'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb (:'transactions/show')
end

get '/transactions/:id/edit' do 
  @transaction =  Transaction.find(params[:id])
  @types = Type.all
  @companies = Company.all
  erb (:'transactions/edit')
end

put '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect to ("transactions/new")
end

delete '/transactions/:id' do
Transaction.destroy(params[:id])
  redirect to ('/transactions')
end





