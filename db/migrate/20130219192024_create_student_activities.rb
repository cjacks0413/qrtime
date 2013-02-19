class CreateStudentActivities < ActiveRecord::Migration
  def change
    drop_table :student_activities
    create_table :student_activities do |t|
      t.integer :user_id
      t.integer :course_session_id
      t.string :action
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
