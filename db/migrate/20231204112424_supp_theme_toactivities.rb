class SuppThemeToactivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :type, :string
  end
end
