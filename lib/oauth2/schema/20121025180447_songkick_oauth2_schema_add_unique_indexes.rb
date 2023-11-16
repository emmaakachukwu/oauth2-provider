class Oauth2SchemaAddUniqueIndexes < ActiveRecord::Migration
  FIELDS = [:code, :refresh_token]

  def self.up
    FIELDS.each do |field|
      remove_index :oauth2_authorization, [:client_id, field]
      add_index :oauth2_authorization, [:client_id, field], :unique => true
    end
    remove_index :oauth2_authorization, [:access_token]
    add_index :oauth2_authorization, [:access_token], :unique => true

    remove_index :oauth2_client, [:client_id]
    add_index :oauth2_client, [:client_id], :unique => true

    add_index :oauth2_client, [:name], :unique => true
  end

  def self.down
    FIELDS.each do |field|
      remove_index :oauth2_authorization, [:client_id, field]
      add_index :oauth2_authorization, [:client_id, field]
    end
    remove_index :oauth2_authorization, [:access_token]
    add_index :oauth2_authorization, [:access_token]

    remove_index :oauth2_client, [:client_id]
    add_index :oauth2_client, [:client_id]

    remove_index :oauth2_client, [:name]
  end
end
