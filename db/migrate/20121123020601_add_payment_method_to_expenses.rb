class AddPaymentMethodToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_method, :string, :limit => 25
  end
end
