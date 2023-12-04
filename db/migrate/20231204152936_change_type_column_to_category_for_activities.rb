class ChangeTypeColumnToCategoryForActivities < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :type, :category
  end
end
