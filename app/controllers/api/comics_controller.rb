class Api::ComicsController < Api::BaseApiController
  
  def index
    
    
    
    if params[:livesearch].present? 
      livesearch = "%#{params[:livesearch]}%"
      @objects = Comic.where{ 
        (
          (name =~  livesearch ) 
        )
        
      }.page(params[:page]).per(params[:limit]).order("id DESC")
      
      @total = Comic.where{ 
        (
          (name =~  livesearch )  
        )
      }.count
      
    else
      @objects =  Comic.page(params[:page]).per(params[:limit]).order("id DESC")
      @total = Comic.count
    end
    
    
    
    
    
    # render :json => { :comics => @objects , :total => @total, :success => true }
  end

  def create
    @object = Comic.create_object( params[:comic] )  
    
    
 
    if @object.errors.size == 0 
      render :json => { :success => true, 
                        :comics => [@object] , 
                        :total => Comic.active_objects.count }  
    else
      msg = {
        :success => false, 
        :message => {
          :errors => extjs_error_format( @object.errors )  
        }
      }
      
      render :json => msg                         
    end
  end

  def update
    
    @object = Comic.find_by_id params[:id] 
    @object.update_object( params[:comic])
     
    if @object.errors.size == 0 
      render :json => { :success => true,   
                        :comics => [@object],
                        :total => Comic.active_objects.count  } 
    else
      msg = {
        :success => false, 
        :message => {
          :errors => extjs_error_format( @object.errors )  
        }
      }
      
      render :json => msg 
    end
  end

  def destroy
    @object = Comic.find(params[:id])
    @object.delete_object

    if not @object.persisted?
      render :json => { :success => true, :total => Comic.active_objects.count }  
    else
      render :json => { :success => false, :total => Comic.active_objects.count }  
    end
  end

end
