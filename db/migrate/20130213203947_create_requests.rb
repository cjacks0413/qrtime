class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :subject
      t.text :content
      t.boolean :read
      t.timestamps
    end
  end
end