class AddUnameToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :uname, :string, null: false, unique: true
  end
end
