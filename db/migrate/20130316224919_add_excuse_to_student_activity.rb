class AddExcuseToStudentActivity < ActiveRecord::Migration
  def change
    add_column :student_activities, :excuse, :string
  end
end
