require_relative('models/tickets')
require_relative('models/films')
require_relative('models/customers')

require ('pry-byebug')

customer1 = Customer.new({"name" => "Angus", "funds" => 350})
customer1.save
customer2 = Customer.new({"name" => "Zsolt", "funds" => 304})
customer2.save
customer3 = Customer.new({"name" => "Cindi", "funds" => 1304})
customer3.save

film1 = Film.new({"title" => "Batman", "price" => 24 })
film1.save
film2 = Film.new({"title" =>  "Once were Warriors", "price" => 23})
film2.save
film3 = Film.new({"title" => "Jaws", "price" => 25})
film3.save

ticket1 = Tickets.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Tickets.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Tickets.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3.save()






binding.pry
nil
