class CreateJoinCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :join_circles do |t|
      t.references :user, foreign_key: true
      t.references :circle, foreign_key: true

      t.timestamps
    end
  end
end
