class AddStatusToTorrents < ActiveRecord::Migration[5.1]
  def change
    add_column :torrents, :status, :integer, default: 0
  end
end
