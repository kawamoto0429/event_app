class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
