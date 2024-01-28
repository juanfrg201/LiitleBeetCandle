class ChangeColumnDateToDateTimeToSales < ActiveRecord::Migration[7.1]
  def change
    change_column :sales, :sale_date, :datetime
  end
end
