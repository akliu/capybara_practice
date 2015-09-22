class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text :body, null: false
      t.integer :commenting_user_id, null: false, index: true
      t.integer :commented_user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
