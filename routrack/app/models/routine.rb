class Routine < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  
  has_many :performances, :through => :tasks
  
  def run(routine="yamls/fast_test.routine.yaml")
    # TODO RS 2011-11-23_19:43 File import into database =
    # TODO RS 2011-11-23_19:44 Run from database =
    # TODO RS 2011-11-23_19:45 Allow starting with core argument only (without yamls and .routine.yaml) =
    
    
  end
end
