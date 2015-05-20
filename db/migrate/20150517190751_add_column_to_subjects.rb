class AddColumnToSubjects < ActiveRecord::Migration
  def change
    rename_column(:subjects, :postion, :position)
  end
end
