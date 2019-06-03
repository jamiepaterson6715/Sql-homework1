require_relative('../db/sql_runner')
require_relative('films')
require_relative('customers')

class Tickets

attr_reader :id, :film_id, :customer_id
attr_accessor :funds

def initialize(options)

  @id = options['id'].to_i if options['id']
  @film_id = options['film_id']
  @customer_id = options['customer_id']
end

#CREATE
def save()
  sql = "INSERT INTO tickets(film_id, customer_id) VALUES ($1, $2) RETURNING *"
   values = [@film_id, @customer_id]
   result = SqlRunner.run(sql, values).first
   @id = result['id'].to_i
end

#UPDATE
def update()
    sql = "UPDATE tickets SET funds = $1 WHERE id = $2"
    values = [@film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    result = SqlRunner.run(sql)
    tickets = result.map{|ticket| Tickets.new(ticket)}
    return tickets
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end



end
