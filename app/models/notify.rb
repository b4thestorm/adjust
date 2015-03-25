class Notify < ActiveRecord::Base
belongs_to :employee
belongs_to :notifyable, polymorphic: true
end