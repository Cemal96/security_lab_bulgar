class AddMd2hashedPassword < ActiveRecord::Migration
  def change
    add_column :users, :md2_pass, :string
  end
end
