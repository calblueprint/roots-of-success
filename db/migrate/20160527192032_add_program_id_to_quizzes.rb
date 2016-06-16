class AddProgramIdToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :program_id, :integer
    add_index :quizzes, :program_id
  end
end
