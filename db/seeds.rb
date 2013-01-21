# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


#seed members
start = 0
max = 24
cities = ['Houston', 'Humble', 'Kingwood', 'Katy', 'Missouri City', 'Pearland', 'Bellaire', 'Friendswood']
zips =['77004', '77050', '77339', '77346', '77002', '77312', '77026', '77236', '77045', '77001']
while start < max
  member = Member.new(first_name: Random.firstname,
                      last_name: Random.lastname,
                      address: Random.address_line_1,
                      city: cities.sample,
                      state: "TX",
                      zipcode: zips.sample,
                      phone_number: Random.phone,
                      email: Random.email)
  member.save
  start += 1
end

#seed donations
start = 0
max = 74
while start < max
  random_value = (200.00 - 5.00) * rand() + 5
  donation = Donation.new(amount: random_value.to_c,
                          date_given: Random.date(1000).to_date,
                          donation_type: ['tithes', 'offering', 'undisclosed', 'building-fund'].sample)
  member = Member.all.sample
  donation.member= member
  donation.save
  start +=1
end

#seed events
start = 0
stop = 6
while start < stop
  random_value = (1200.00 - 50.00) * rand() + 50
  name = ['Pastors', 'Church', 'Family'].sample + ' ' + ['Day', 'Anniversary', 'Picnic', 'Month'].sample
  event = Event.new(name: name,
                    comments: Random.paragraphs[0...235])
  event.members << Member.find_all_by_state('TX').shuffle.first(7)
  event.estimated_cost= random_value
  event.actual_cost= random_value-10.00
  event.save
  start +=1
end

#seed vendors
start = 0
stop = 9
while start < stop
  vendor = Vendor.new(name: Random.company_name,
                      address: Random.address_line_1,
                      city: Random.city,
                      state: Random.state_code,
                      phone_number: Random.phone,
                      email: Random.email,
                      zipcode: Random.zipcode)
  vendor.save
  start +=1
end

#seed Accounts
start = 0
stop = 3
banks = ['Chase', 'Capital One', 'Omni Bank', 'Woodforest Bank', 'Bank of Texas']

while start < stop
  random_value = (500000.00 - 5000.00) * rand() + 5000
  name = banks.shuffle.sample
  account = Account.new(name: name,
                        account_number: Random.zipcode.concat(Random.zipcode),
                        balance: random_value)
  account.save
  start +=1
end

#seed expenses


name_options = ['inventory purchase', 'payroll', 'service', 'utilities', 'miscellaneous', 'charity']
total_available = 0
accounts = Account.all
accounts.each do |a|
  total_available += a.balance
end
target = total_available*0.80
accounts = Account.all
methods = ['CC', 'Check', 'Cash', 'ACH']
while total_available > target
  random_value = (5000.00 - 1.00) * rand() + 1
  expense = Expense.new(name: name_options.shuffle.sample, amount: random_value)
  expense.account = accounts.sample
  expense.date_of= Random.date
  expense.payment_method = methods.sample
  expense.vendor = Vendor.all.sample
  expense.save
  total_available -= random_value

end

#seed ministries

start = 0
ministries =['Deacon Board','Usher Board','BTU','Youth Choir','Sunday School','Basketball Team']
week_days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
times = ['8:00 AM','12:00 PM','5:00 PM','7:00 PM','6:00 PM','8:00 PM','1:00 PM']
while start< 5

  ministry = Ministry.new(name: ministries.sample,
                          meeting_day: week_days.sample,
                          meeting_time: times.sample,
                          dues_collected: 500.00.to_c,
                          balance_avaialable: [32500.to_c,400.00.to_c,225.00.to_c].sample)
  ministry.members << Member.find_all_by_state("TX").sample(7)
  ministry.save
  start+=1
end

#seed budgets

Event.all.each do |e|
  t = e.name + ' Budget'
  b = Budget.new(name: t, limit: 1000.00.to_c, start_date: Date.today.to_date, allocated_amount: 0.00.to_c )
  b.event = e
  while b.allocated_amount < 300
    count = rand(5-1)  *  rand() +1
    cost = rand(75 -5) * rand() + 5
    item = BudgetItem.new(cost_per:cost, quantity: count, title: Random.alphanumeric(15))
    b.budget_items << item
    b.allocated_amount += item.total_cost
  end
  b.save
end
