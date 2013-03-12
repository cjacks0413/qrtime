class ChangeDataTypeForStudentActivityTime < ActiveRecord::Migration
  def up
    change_table :student_activities do |t|
      t.change :time, :datetime
    end
  end

  def down
    change_table :student_activities do |t|
      t.change :time, :time
  end
  end
end
