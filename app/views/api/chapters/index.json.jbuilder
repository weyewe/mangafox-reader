
json.success true 
json.total @total
json.chapters @objects do |object|
	json.id 								object.id  
	

 
	 
	json.comic_id		object.comic_id 
	json.chapter				object.chapter
	
	json.volume 								object.volume
	json.initial_link 					object.initial_link
	json.is_parsed					object.is_parsed 

	
end


