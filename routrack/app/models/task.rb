class Task < ActiveRecord::Base
    has_and_belongs_to_many :routines
    has_many :performances
end
