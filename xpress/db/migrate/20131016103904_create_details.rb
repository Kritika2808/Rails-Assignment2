class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :contact
      t.text :address
      t.references :user, index: true

      t.timestamps
    end
  end
end
