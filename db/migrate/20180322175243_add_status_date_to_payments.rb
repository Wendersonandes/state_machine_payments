class AddStatusDateToPayments < ActiveRecord::Migration
  def change
		add_column :payments, :status_date, :datetime
  end
end
