class Routine < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  has_many :performances, :through => :tasks
end
