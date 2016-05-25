require_relative '../models/cashboard'

get '/' do 
  @cashboard = Cashboard.new
  erb :'cashboard/index'
end