class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :author
      t.datetime :created_at
      t.references :post, index: true, foreign_key: true
    end
  end
end
