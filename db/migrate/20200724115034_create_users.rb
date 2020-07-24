class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('default', 'legal_person', 'moderator');
    SQL

    create_table :users do |t|
      t.string :password_digest
      t.string :email
      t.string :username
      t.string :address
      t.string :profession
      t.string :workplace
      t.column :role, :user_role, default: 'default'
      t.bigint :deleted_by
      t.bigint :banned_by
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end

  def down
    drop_table :users

    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
