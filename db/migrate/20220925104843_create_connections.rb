class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.references :phrase, null: false, foreign_key: true
      t.references :ad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
