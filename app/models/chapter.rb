require 'nokogiri'
require 'open-uri'
class Chapter < ActiveRecord::Base
   
  validates_presence_of :comic_id, :chapter, :volume 
  belongs_to :comic 
  
  validate :valid_comic_id
  
  def valid_comic_id 
    return if not  self.comic_id.present? 
    
    object  = Comic.find_by_id self.comic_id 
    if object.nil?
      self.errors.add(:generic_errors, "Harus ada comic ID ")
      return self 
    end
  end
  
  
  
 
  
  def self.create_object( params ) 
    new_object           = self.new
    new_object.comic_id            = params[:comic_id]
    new_object.chapter                = params[:chapter    ]
    new_object.volume                = params[:volume    ]
      
    
    new_object.save
    return new_object
  end
  
  
   
  
  def update_object(params)
    
    self.chapter                = params[:chapter    ]
    self.volume                = params[:volume    ]
    self.save
    
    return self
  end
  
  def delete_object
    self.destroy
  end
  
  def self.active_objects
    self
  end
  
  
  def vanity
    self.comic.vanity_name
  end
  
  def extract_img(end_url)
    # base_url = "http://mangafox.me/manga/fairy_tail/v07/c051/#{end_url}.html"
    
    
    base_url = "http://mangafox.me/manga/#{vanity}/#{volume}/#{chapter}/#{end_url}.html"
    page = Nokogiri::HTML(open(  base_url     ))  
    image = page.css("#viewer img")
    return image.first['src']
  end
  
  def extract_pages
    
    page_url = "http://mangafox.me/manga/#{vanity}/#{volume}/#{chapter}/1.html"

    page = Nokogiri::HTML(open(  page_url     ).read )  

    image_array = [] 

    result = page.css("#top_center_bar div.l select.m option")
    awesome_result = result.map {|x| x['value']   }  
    awesome_result.delete("0")


    
    awesome_result.each do |x|
      image_array  << extract_img(x) 
    end
    
    # puts "this is the image arary*****\n"*100
    # puts image_array
    return image_array 
    
    
    
  end
    
end
