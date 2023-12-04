class SuppThemeToactivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :theme
    add_column :activities, :type, :string
  end
end
