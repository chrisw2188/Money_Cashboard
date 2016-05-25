require 'pry-byebug'
require 'pg'
require_relative '../db/sql_runner'
require_relative '../models/transaction'

class Cashboard

  attr_reader :transactions

  def initialize
    @transactions = Transaction.all
  end

  def balance
    balance = 0
    @transactions.each do |transaction| 
      if transaction.debit_credit == "Credit"
      balance += transaction.amount
      elsif transaction.debit_credit == "Debit"
      balance -= transaction.amount
      end 
    end
    return balance
  end



end

