require "pg"
require_relative '../db/sql_runner'

class Type

attr_reader :id, :type

def initialize(options)
  @id = options['id'].to_i
  @type = options['type']
end

  def save
    sql = "INSERT INTO types (type) VALUES ('#{type}') RETURNING * "
    return Type.map_item(sql)
  end

  def self.all
    sql = "SELECT * FROM types"
    return Type.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM types"
    SqlRunner.run_sql(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM types WHERE id = #{id}"
    return Type.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE types SET
    type = '#{options['type']}'
    WHERE id = #{options['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM types WHERE id = #{id}"
    return Type.map_items(sql)
  end

  def self.map_items(sql)
    types = SqlRunner.run_sql(sql)
    result = types.map { |type| Type.new( type ) }
    return result
  end

  def self.map_item(sql)
    result = Type.map_items(sql)
    return result.first
  end

end