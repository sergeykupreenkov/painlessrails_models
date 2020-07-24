class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.belongs_to :user
      t.string :name
      t.string :background_color, default: 'ffebeb'

      t.timestamps
    end
  end
end
