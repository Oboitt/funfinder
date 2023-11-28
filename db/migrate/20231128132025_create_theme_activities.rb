class CreateThemeActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :theme_activities do |t|
      t.references :theme, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
