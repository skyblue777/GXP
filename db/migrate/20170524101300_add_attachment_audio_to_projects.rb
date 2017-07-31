class AddAttachmentAudioToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :projects, :audio
  end
end
