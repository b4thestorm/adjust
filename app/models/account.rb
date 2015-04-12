class Account < ActiveRecord::Base
	has_many :employees
	belongs_to :owner, class_name: 'Employee', foreign_key: 'owner_id'
	accepts_nested_attributes_for :owner

  def self.current_id=(id)
    Thread.current[:account_id] = id
  end

  def self.current_id
    Thread.current[:account_id]
  end
end
