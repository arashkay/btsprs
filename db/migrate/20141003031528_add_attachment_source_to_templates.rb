class AddAttachmentSourceToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :source
    end
  end

  def self.down
    remove_attachment :templates, :source
  end
end
