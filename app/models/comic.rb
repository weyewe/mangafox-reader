
class Comic < ActiveRecord::Base
   
  validates_presence_of :name, :vanity_name 
  validates_uniqueness_of :name 
  
 
  
  def self.create_object( params ) 
    new_object           = self.new
    new_object.name            = params[:name]
    new_object.vanity_name                = params[:vanity_name    ]
    new_object.save
    
    return new_object
  end
  
  
   
  
  def update_object(params)
    
    self.name            = params[:name]
    self.vanity_name                = params[:vanity_name    ]
    
    self.save
    
    return self
  end
  
  def self.active_objects
    self
  end
  
  
  def delete_object
    self.destroy 
  end
  
    
end
