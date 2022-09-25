class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.text :content
      t.string :decade

      t.timestamps
    end
  end
end
