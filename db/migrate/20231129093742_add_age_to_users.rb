class AddAgeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer
  end
end
