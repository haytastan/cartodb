Sequel.migration do
  up do
    create_table :mapcaps do
      Uuid :id, primary_key: true, default: 'uuid_generate_v4()'.lit
      Uuid :visualization_id, type: 'uuid', null: false

      String :export_json, null: false, type: 'text'
      String :ids_json, null: false, type: 'json'

      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
    end

    alter_table :mapcaps do
      add_index [:visualization_id, :created_at]
    end
  end

  down do
    alter_table :mapcaps do
      drop_index [:visualization_id, :created_at]
    end

    drop_table :mapcaps
  end
end
