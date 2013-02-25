class CreateCoursesUsers < ActiveRecord::Migration
  def up
    create_table :courses_users, :id => false do |t|
      t.integer :course_id, :null => false
      t.integer :user_id, :null => false
    end
    # Add index to speed up looking up the connection, and ensure
    # we only enrol a student into each course once
    add_index :courses_users, [:course_id, :user_id], :unique => true
  end

  def down
    remove_index :courses_users, :column => [:course_id, :user_id]
    drop_table :courses_users
  end
end
