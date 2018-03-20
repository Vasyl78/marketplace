class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string  :title
      t.text    :body
      t.integer :object_id
      t.string  :object_type
      t.integer :user_id

      t.timestamps
    end
  end
end
