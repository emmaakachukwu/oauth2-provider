class Oauth2SchemaAddUniqueIndexes < ActiveRecord::Migration[6.1]
  FIELDS = [:code, :refresh_token]

  def self.up
    remove_index :oauth2_authorization, column: [:client_id, :code]
    remove_index :oauth2_authorization, column: [:client_id, :refresh_token], name: 'index_client_refresh'
    add_index :oauth2_authorization, [:client_id, :code], :unique => true
    add_index :oauth2_authorization, [:client_id, :refresh_token], name: 'index_client_refresh', :unique => true

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
