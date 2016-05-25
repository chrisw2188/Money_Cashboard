require('pg')
require 'pry-byebug'
require 'date'
require_relative('../db/sql_runner')
require_relative ('../models/type')
require_relative ('../models/company')

class Transaction 

attr_reader :id, :debit_credit, :type_id, :company_id, :amount, :dot

  def initialize(options)
    @id = options['id'].to_i
    @debit_credit = options['debit_credit']
    @type_id = options['type_id'].to_i
    @company_id = options['company_id'].to_i
    @amount = options['amount'].to_i
    @dot = DateTime.parse(options['dot']).to_date
  end

  def save()
    sql = "INSERT INTO transactions (debit_credit, type_id, company_id, amount, dot) VALUES ('#{debit_credit}', '#{type_id}', '#{company_id}', '#{amount}', '#{dot}')"
    return Transaction.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run_sql(sql)
  end

  def self.update(options)
    sql = "UPDATE transactions SET
    debit_credit = '#{options['debit_credit']}',
    type_id = #{options['type_id']},
    company_id = #{options['company_id']},
    amount = #{options['amount']},
    dot = '#{DateTime.parse(options['dot']).to_date}'
    WHERE id = #{options['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item(sql)
  end

  def company 
    sql = "SELECT * FROM companies WHERE id = #{@company_id}"
    return Company.map_item(sql)
  end

  def type 
    sql = "SELECT * FROM types WHERE id = #{type_id}"
    return Type.map_item(sql)
  end

  def last
    
  end

  # def self.balance
  #   balance = 0
  #   transactions = Transaction.all
  #   transactions.each do |transaction| 
  #     if transaction.debit_credit == "Credit"
  #     balance += transaction.amount
  #     elsif transaction.debit_credit == "Debit"
  #     balance -= transaction.amount
  #     end 
  #   end
  #   return balance
  # end

  def self.map_items(sql)
    transactions = SqlRunner.run_sql(sql)
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end

end



