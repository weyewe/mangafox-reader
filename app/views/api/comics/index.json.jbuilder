
json.success true 
json.total @total
json.comics @objects do |object|
	json.id 								object.id  
	

 
	 
	json.name		object.name 
	json.vanity_name				object.vanity_name
	 


	
end


