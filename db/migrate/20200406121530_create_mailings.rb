class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string :subject
      t.text :content
      t.datetime :delivered_at

      t.timestamps null: false
    end
  end
end
