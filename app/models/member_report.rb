class MemberReport
  include Datagrid

  # Scope
  scope do
    Member
  end

  # Filters
  filter(:first_name, :string)
  filter(:last_name, :string)
  filter(:city, :string)
  #filter(:registration_type, :enum, :select => User::REGISTRATION_TYPES.map {|r| [r.humanize, r]})
  #integer_range_filters(:logins_count, {:default => proc { User.minimum(:logins_count)}}, {:default => proc {User.maximum(:logins_count)}})
  #filter(:registered_at, :date, :range => true)

  # Columns
  column (:first_name)
  column (:last_name)
  #column (:address)
  column (:city)
  column (:state)
  column (:zipcode)
  column (:phone_number)
  column (:email)
  #column(:id)


end