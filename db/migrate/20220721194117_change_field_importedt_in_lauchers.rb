class ChangeFieldImportedtInLauchers < ActiveRecord::Migration[6.0]
  def change
    change_column :launchers, :imported_t, :string
  end
end
