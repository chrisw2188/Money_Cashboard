require 'pry-byebug'
require 'date'
require_relative '../models/transaction.rb'
require_relative '../models/type.rb'
require_relative '../models/company.rb'

Transaction.delete_all
Type.delete_all
Company.delete_all

type1 = Type.new({'type' => 'Wages'}).save
type2 = Type.new({'type' => 'Bill'}).save
type3 = Type.new({'type' => 'Grocery'}).save

company1 = Company.new({'company' => 'Tesco'}).save
company2 = Company.new({'company' => 'EE'}).save 
company3 = Company.new({'company' => 'Scottish Widows'}).save


transation1 = Transaction.new ({'debit_credit' => 'Debit', 'type_id' => type3.id, 'company_id' => company1.id, 'amount' => 20.00, 'dot' => '10 Aug 2010'})
transation2 = Transaction.new ({'debit_credit' => 'Debit','type_id' => type2.id, 'company_id' => company2.id, 'amount' => 35.00, 'dot' => '10 Aug 2010'})
transation3 = Transaction.new ({'debit_credit' => 'Credit','type_id' => type1.id, 'company_id' => company3.id, 'amount' => 1000.00, 'dot' => '10 Aug 2010'})

t1 = transation1.save
t2 = transation2.save
t3 = transation3.save











