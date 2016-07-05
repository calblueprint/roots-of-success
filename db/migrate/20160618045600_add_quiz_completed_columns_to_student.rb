class AddQuizCompletedColumnsToStudent < ActiveRecord::Migration
  def change
    # columns named by only first word of module name
    add_column :students, :fundamentals_quiz_completed, :float, default: -1
    add_column :students, :water_quiz_completed, :float, default: -1
    add_column :students, :waste_quiz_completed, :float, default: -1
    add_column :students, :transportation_quiz_completed, :float, default: -1
    add_column :students, :energy_quiz_completed, :float, default: -1
    add_column :students, :building_quiz_completed, :float, default: -1
    add_column :students, :health_quiz_completed, :float, default: -1
    add_column :students, :community_quiz_completed, :float, default: -1
    add_column :students, :application_quiz_completed, :float, default: -1
    add_column :students, :financial_quiz_completed, :float, default: -1
  end
end
