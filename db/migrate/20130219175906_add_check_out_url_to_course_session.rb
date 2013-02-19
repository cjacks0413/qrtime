class AddCheckOutUrlToCourseSession < ActiveRecord::Migration
  def change
    add_column :course_sessions, :check_out_url, :string
  end
end
