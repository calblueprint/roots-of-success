class CreateChangelogItems < ActiveRecord::Migration
  def change
    create_table :changelog_items do |t|
      t.timestamps

      t.text :text
    end
  end
end
