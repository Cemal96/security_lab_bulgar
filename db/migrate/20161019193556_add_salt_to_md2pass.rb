class AddSaltToMd2pass < ActiveRecord::Migration
  def change
    change_column_default :users, :md2_pass, "nothing"
    add_column :users, :md2_salt, :string, default: "123"
  end
end
