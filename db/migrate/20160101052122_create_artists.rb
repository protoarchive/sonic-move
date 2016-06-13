class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :portrait
      t.string :zipcode

      t.string :twitter
      t.string :facebook
      t.string :spotify

      t.timestamps null: false
    end
  end
end
