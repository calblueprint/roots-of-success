class AddResponseBelongToFeedback < ActiveRecord::Migration
  def change
    add_reference :responses, :feedback, index: true
    add_reference :responses, :teacher_id, index: true
    add_reference :responses, :student_id, index: true
    remove_column :responses, :user_id
  end
end
