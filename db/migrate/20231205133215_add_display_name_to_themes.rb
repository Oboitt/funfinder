class AddDisplayNameToThemes < ActiveRecord::Migration[7.1]
  def change
    add_column :themes, :display_name, :string
  end
end
