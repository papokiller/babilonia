class CreateTorrents < ActiveRecord::Migration[5.1]
  def change
    create_table :torrents do |t|
      t.jsonb :data
      t.string :provider
      t.string :torrentable_type
      t.integer :torrentable_id

      t.timestamps
    end
  end
end
