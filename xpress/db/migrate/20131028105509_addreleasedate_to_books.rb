class AddreleasedateToBooks < ActiveRecord::Migration
  def change
     add_column :books, :releasedate, :date
  end
end
