class UpdateTriggers < ActiveRecord::Migration[5.2]
  def up
    drop_table :triggers
    create_table :triggers do |t|
      t.integer :market_id, unsigned: true, index: true, null: false
      t.string :market_type, default: 'spot', null: false
      t.decimal :trigger_price, precision: 32, scale: 16, null: false
      t.string :side, limit: 10, null: false
      t.decimal :amount, precision: 32, scale: 16, null: false
      t.decimal :price, precision: 32, scale: 16
      t.integer :member_id, index: true, unsigned: true
      t.integer :order_id, index: true, unsigned: true
      t.integer :status, null: false, index: true, unsigned: true
      t.timestamps
    end

    add_index(:triggers, %w[market_id market_type]) unless index_exists?(:triggers, %w[market_id market_type])
  end

  def down
    drop_table :triggers
    create_table :triggers do |t|
      t.references :order,      null: false, index: true
      t.integer    :order_type, null: false, index: true, limit: 1, unsigned: true
      t.binary     :value,      null: false, limit: 128
      t.integer    :state,      null: false, default: 0, index: true, limit: 1, unsigned: true
      t.timestamps
    end

    remove_index(:triggers, %w[market_id market_type]) unless index_exists?(:triggers, %w[market_id market_type])
  end
end
