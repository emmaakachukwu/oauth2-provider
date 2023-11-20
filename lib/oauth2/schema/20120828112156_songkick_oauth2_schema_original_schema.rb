class Oauth2SchemaOriginalSchema < ActiveRecord::Migration
  def self.up
    create_table :oauth2_client do |t|
      t.timestamps
      t.string     :oauth2_client_owner_type
      t.integer    :oauth2_client_owner_id
      t.string     :name
      t.string     :client_id
      t.string     :client_secret_hash
      t.string     :redirect_uri
    end
    add_index :oauth2_client, [:client_id]

    create_table :oauth2_authorization do |t|
      t.timestamps
      t.string     :oauth2_resource_owner_type
      t.integer    :oauth2_resource_owner_id
      t.belongs_to :client
      t.string     :scope
      t.string     :code,               :limit => 40
      t.string     :access_token,  :limit => 40
      t.string     :refresh_token, :limit => 40
      t.datetime   :expires_at
    end
    add_index :oauth2_authorization, [:client_id, :code]
    add_index :oauth2_authorization, [:access_token]
    add_index :oauth2_authorization, [:client_id, :access_token]
    add_index :oauth2_authorization, [:client_id, :refresh_token], name: 'index_client_refresh'
  end

  def self.down
    drop_table :oauth2_client
    drop_table :oauth2_authorization
  end
end
