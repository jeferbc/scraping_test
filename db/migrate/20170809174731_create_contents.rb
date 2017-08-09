class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :tag
      t.string :content
      t.references :webpage, foreign_key: true

      t.timestamps
    end
  end
end
