class Api::ChaptersController < Api::BaseApiController
  
  def index
    
    
    
    if params[:livesearch].present? 
      livesearch = "%#{params[:livesearch]}%"
      @objects = Chapter.where{ 
        (
          (volume =~  livesearch )  | 
          (chapter =~  livesearch )  
        )
        
      }.page(params[:page]).per(params[:limit]).order("id DESC")
      
      @total = Chapter.where{ 
        (
          (volume =~  livesearch )  | 
          (chapter =~  livesearch )
        )
      }.count
      
      # calendar
      
    elsif params[:parent_id].present?
      # @group_loan = GroupLoan.find_by_id params[:parent_id]
      @objects = Chapter.
                  where(:comic_id => params[:parent_id]).
                  page(params[:page]).per(params[:limit]).order("id DESC")
      @total = Chapter.where(:comic_id => params[:parent_id]).count 
    else
      @objects = []
      @total = 0 
    end
    
    
    
    
    
    # render :json => { :chapters => @objects , :total => @total, :success => true }
  end

  def create
    @object = Chapter.create_object( params[:chapter] )  
    
    
 
    if @object.errors.size == 0 
      render :json => { :success => true, 
                        :chapters => [@object] , 
                        :total => Chapter.active_objects.count }  
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
    
    @object = Chapter.find_by_id params[:id] 
    @object.update_object( params[:chapter])
     
    if @object.errors.size == 0 
      render :json => { :success => true,   
                        :chapters => [@object],
                        :total => Chapter.active_objects.count  } 
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
    @object = Chapter.find(params[:id])
    @object.delete_object

    if not @object.persisted?
      render :json => { :success => true, :total => Chapter.active_objects.count }  
    else
      render :json => { :success => false, :total => Chapter.active_objects.count }  
    end
  end
  
  def search
    search_params = params[:query]
    selected_id = params[:selected_id]
    if params[:selected_id].nil?  or params[:selected_id].length == 0 
      selected_id = nil
    end
    
    query = "%#{search_params}%"
    # on PostGre SQL, it is ignoring lower case or upper case 
    
    if  selected_id.nil?
      @objects = Chapter.joins(:comic).where{ 
                            (comic.name =~ query)    
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
                        
      @total = Chapter.joins(:comic).where{ 
              (comic.name =~ query)    
                              }.count
    else
      @objects = Chapter.where{ (id.eq selected_id)  
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
   
      @total = Chapter.where{ (id.eq selected_id)   
                              }.count 
    end
    
    
    # render :json => { :records => @objects , :total => @total, :success => true }
  end
end
