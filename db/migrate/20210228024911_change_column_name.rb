class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :providers, :descriçao, :description 
  end
end
