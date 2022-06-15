class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :overview
      t.datetime :start_day
      t.datetime :end_day

      t.timestamps
    end
  end
end
