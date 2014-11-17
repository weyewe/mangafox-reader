
class Page < ActiveRecord::Base
   
  validates_presence_of :comic_id, :chapter_id, :image_url
  belongs_to :comic 
  belongs_to :chapter 
  
  validate :valid_comic_id
  validate :valid_chapter_id 
  
  def valid_comic_id 
    return if not  self.comic_id.present? 
    
    object  = Comic.find_by_id self.comic_id 
    if object.nil?
      self.errors.add(:generic_errors, "Harus ada comic ID ")
      return self 
    end
  end
  
  def valid_chapter_id
    return if not  self.chapter_id.present? 
    
    object  = Chapter.find_by_id self.chapter_id 
    if object.nil?
      self.errors.add(:generic_errors, "Harus ada chapter_id  ")
      return self 
    end
  end
  
  
  
 
  
  def self.create_object( params ) 
    new_object           = self.new
    new_object.comic_id            = params[:comic_id]
    new_object.chapter_id                = params[:chapter_id    ]
    new_object.image_url                = params[:image_url    ]
      
    
    return new_object
  end
  
  
   
  
  def update_object(params)
    
    self.image_url                = params[:image_url    ]
    self.save
    
    return self
  end
    
end
