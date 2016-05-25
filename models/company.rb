require "pg"
require_relative '../db/sql_runner'

class Company

attr_reader :id, :company

def initialize(options)
  @id = options['id'].to_i
  @company = options['company']
end

  def save
    sql = "INSERT INTO companies (company) VALUES ('#{company}') RETURNING *"
    return Company.map_item(sql)
  end

  def self.all
    sql = "SELECT * FROM companies"
    return Company.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM companies WHERE id = #{id}"
    return Company.map_item(sql)
  end

  def self.delete_all
    sql = "DELETE FROM companies "
    SqlRunner.run_sql(sql)
  end

  def self.update(options)
    sql = "UPDATE companies SET
    company = '#{options['company']}'
    WHERE id = #{options['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM companies WHERE id = #{id}"
    return Company.map_items(sql)
  end

  def self.map_items(sql)
    companies = SqlRunner.run_sql(sql)
    result = companies.map { |company| Company.new( company ) }
    return result
  end

  def self.map_item(sql)
    result = Company.map_items(sql)
    return result.first
  end

end