class AddAttachmentImageToChampions < ActiveRecord::Migration[7.1]
  def self.up
    change_table :champions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :champions, :image
  end
end
