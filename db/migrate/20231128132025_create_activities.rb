class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :brand
      t.string :address
      t.text :content
      t.date :date_begin
      t.date :date_end
      t.string :website

      t.timestamps
    end
  end
end
