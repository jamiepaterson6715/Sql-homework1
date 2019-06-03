require_relative("../db/sql_runner")
require_relative("films")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @name = options["name"]
    @funds = options['funds']
  end

#CREATE
  def save
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING *"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i
  end

  def films
     sql = "SELECT FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
     values = [@id]
     result = SqlRunner.run(sql, values)
     return result.map {|film| Film.new(film)}
   end



  #UPDATE
  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values =[@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  #READ
def self.all()
  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
  result = customers.map {|customer| Customer.new(customer)}
  return result
end
#DELETE

def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)

end




end
