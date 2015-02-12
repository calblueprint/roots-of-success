class AddTypeToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :type, :string
  end
end
