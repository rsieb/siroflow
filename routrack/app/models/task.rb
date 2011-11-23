class Task < ActiveRecord::Base
  has_many :performances
  belongs_to :routines
end
