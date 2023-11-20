class Oauth2SchemaAddAuthorizationIndex < ActiveRecord::Migration[6.1]
  INDEX_NAME = 'index_owner_client_pairs'

  def self.up
    remove_index :oauth2_authorization, [:client_id, :access_token]
    add_index :oauth2_authorization, [:client_id, :oauth2_resource_owner_type, :oauth2_resource_owner_id], :name => INDEX_NAME, :unique => true
  end

  def self.down
    remove_index :oauth2_authorization, :name => INDEX_NAME
    add_index :oauth2_authorization, [:client_id, :access_token]
  end
end
