class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_status
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
