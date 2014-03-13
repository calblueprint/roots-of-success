class AddSlideshowToModule < ActiveRecord::Migration
  def change
    add_column :learning_modules, :presentation_embed_code, :text
  end
end
