class DropTable < ActiveRecord::Migration
  def up
    drop_table :course_students
    drop_table :course_users
    drop_table :courses_students
  end

  def down
  end
end
