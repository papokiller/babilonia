class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :collection_type
      t.json :data

      t.timestamps
    end
  end
end
