class ChangeFieldStatusInLauchers < ActiveRecord::Migration[6.0]
  def change
    change_column :launchers, :status, :integer, default: 0
  end
end
