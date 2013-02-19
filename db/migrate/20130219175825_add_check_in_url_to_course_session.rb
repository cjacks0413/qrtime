class AddCheckInUrlToCourseSession < ActiveRecord::Migration
  def change
    add_column :course_sessions, :check_in_url, :string
  end
end
