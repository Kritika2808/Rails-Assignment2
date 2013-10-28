class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_title
      t.string :author_name
      t.integer :no_of_pages
      t.string :book_type

      t.timestamps
    end
  end
end
