# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  include Faker

  10.times do
    lord = User.create(email: Internet.email, name: Name.name, address: Address.street_address, phone_number: PhoneNumber.cell_phone,
                password: 'testtest')
    lord.properties << Property.create(name: Company.name, address: Address.street_address)
  end
  5.times do
    user = User.create(email: Internet.email, name: Name.name, address: Address.street_address, phone_number: PhoneNumber.cell_phone,
                password: 'testtest')
    user.contractor!
  end


  # grant = User.create(email: 'gphummer@gmail.com', name: 'Grant Hummer', address: '680 N. Lake Shore Dr.',
  #             phone_numer: '(312)804-3771', password: 'testtest')
  # ryan = User.create(email: 'run6234234@gmail.com', name: 'Ryan Jones', address: '555 W. Utah Drive',
  #             phone_numer: '(123)456-7890', password: 'testtest')
  # ryan.contractor!

  # first_apt = Property.create(owner_id: 1, name: "Trump Tower", address: "Somewhere in Hell")

  # first_job = Job.create(property_id: 1, description: "Fix our plumbing bro", start_date: Time.now,
  #                        end_date: Time.now + 1.day, max_bid: 500, bid_length: 7)

  # first_bid = Bid.create()

