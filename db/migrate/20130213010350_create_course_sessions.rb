class CreateCourseSessions < ActiveRecord::Migration
  def change
    create_table :course_sessions do |t|
      t.integer :course_id
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
