class AddPhotoToTheme < ActiveRecord::Migration[7.1]
  def change
    add_column :themes, :photo, :string
  end
end
