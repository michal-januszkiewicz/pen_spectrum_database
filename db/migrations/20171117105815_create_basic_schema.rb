Hanami::Model.migration do
  up do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :users do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :name, String, null: false
      column :email, String, null: false, unique: true
      column :created_at, DateTime, null: false, default: Time.now
      column :updated_at, DateTime, null: false, default: Time.now

      index :name, unique: true
    end

    create_table :pens do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :name, String, null: false, unique: true
      column :color, String
      column :comments, String
      column :created_at, DateTime, null: false, default: Time.now
      column :updated_at, DateTime, null: false, default: Time.now

      index :name, unique: true
    end

    create_table :measurment_devices do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :name, String, null: false, unique: true
      column :created_at, DateTime, null: false, default: Time.now
      column :updated_at, DateTime, null: false, default: Time.now

      index :name, unique: true
    end

    create_table :measurments do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column :type, String
      column :sample, Integer
      column :date, DateTime
      column :params, String
      column :spectrum, 'Text[]', null: false
      column :comments, String
      column :created_at, DateTime, null: false, default: Time.now
      column :updated_at, DateTime, null: false, default: Time.now

      foreign_key :user_id, :users, type: :uuid, on_delete: :set_null
      foreign_key :measurment_device_id, :measurment_devices, type: :uuid, on_delete: :cascade#, null: false
      foreign_key :pen_id, :pens, type: :uuid, null: false, on_delete: :cascade

      index [:pen_id, :type], unique: true
    end
  end

  down do
    run 'DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE'

    drop_table :measurments
    drop_table :pens
    drop_table :users
    drop_table :measurment_devices
  end
end
