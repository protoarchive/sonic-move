class AddUserToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :user, index: true
    add_foreign_key :artists, :users
  end
end
