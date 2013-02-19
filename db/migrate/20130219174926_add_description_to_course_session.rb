class AddDescriptionToCourseSession < ActiveRecord::Migration
  def change
    add_column :course_sessions, :description, :text
  end
end
