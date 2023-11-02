class Oauth2SchemaAddUniqueIndexes < ActiveRecord::Migration
  FIELDS = [:code, :refresh_token]

  def self.up
    FIELDS.each do |field|
      remove_index :oauth2_authorizations, [:client_id, field]
      add_index :oauth2_authorizations, [:client_id, field], :unique => true
    end
    remove_index :oauth2_authorizations, [:access_token]
    add_index :oauth2_authorizations, [:access_token], :unique => true

    remove_index :oauth2_clients, [:client_id]
    add_index :oauth2_clients, [:client_id], :unique => true

    add_index :oauth2_clients, [:name], :unique => true
  end

  def self.down
    FIELDS.each do |field|
      remove_index :oauth2_authorizations, [:client_id, field]
      add_index :oauth2_authorizations, [:client_id, field]
    end
    remove_index :oauth2_authorizations, [:access_token]
    add_index :oauth2_authorizations, [:access_token]

    remove_index :oauth2_clients, [:client_id]
    add_index :oauth2_clients, [:client_id]

    remove_index :oauth2_clients, [:name]
  end
end
