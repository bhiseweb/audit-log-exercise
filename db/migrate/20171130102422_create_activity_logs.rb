class CreateActivityLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_logs do |t|
      t.string :logable_type, null: false
      t.integer :logable_id, null: false
      t.string :changes_text
      t.timestamps
    end
  end
end
