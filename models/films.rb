require_relative("../db/sql_runner")
require_relative("customers")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)

  @id = options['id'].to_i if options['id']
  @title = options["title"]
  @price = options['price']
end

#CREATE
  def save
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING *"
    values = [@title, @price]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i
  end

  def films
     sql = "SELECT FROM customers INNER JOIN tickets ON customer_id = tickets.customer_id
     WHERE film_id = $1"
     values = [@id]
     result = SqlRunner.run(sql, values)
     return result.map {|customer| customer.new(customer)}
   end



  #UPDATE
  def update
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  #READ
def self.all()
 sql= "SELECT * FROM films"
 films= SqlRunner.run(sql)
 result = films.map {|film| Film.new(film)}
 return result
end

#DElETE
def self.delete_all()
 sql = "DELETE FROM films"
 SqlRunner.run(sql)
end





end
