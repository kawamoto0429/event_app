class CreateJcircles < ActiveRecord::Migration[5.1]
  def change
    create_table :jcircles do |t|
      t.references :circle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
