class ChaptersController < ApplicationController
  layout "chapters"
  
  def show_chapter
    @chapter = Chapter.find_by_id params[:id]
    @pages = @chapter.extract_pages 
  end
end
