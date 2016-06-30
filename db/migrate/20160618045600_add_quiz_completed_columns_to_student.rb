class AddQuizCompletedColumnsToStudent < ActiveRecord::Migration
  def change
    # columns named by only first word of module name
    add_column :students, :Fundamentals_quiz_completed, :float, default: -1
    add_column :students, :Water_quiz_completed, :float, default: -1
    add_column :students, :Waste_quiz_completed, :float, default: -1
    add_column :students, :Transportation_quiz_completed, :float, default: -1
    add_column :students, :Energy_quiz_completed, :float, default: -1
    add_column :students, :Building_quiz_completed, :float, default: -1
    add_column :students, :Health_quiz_completed, :float, default: -1
    add_column :students, :Community_quiz_completed, :float, default: -1
    add_column :students, :Application_quiz_completed, :float, default: -1
    add_column :students, :Financial_quiz_completed, :float, default: -1
  end
end
