class AddAttachmentAvatarToUserprofiles < ActiveRecord::Migration
  def self.up
    change_table :userprofiles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :userprofiles, :avatar
  end
end
