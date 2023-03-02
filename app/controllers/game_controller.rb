class GameController < ActionController::Base

  def import

    begin
      
      puts Game.import( params[:import_file] ) 

      flash[:success] = "<strong>Generation Imported!</strong>"

    rescue => exception 
      puts "Error: #{exception}"
      flash[:error] = "There was a problem importing the file.<br /><strong>#{exception.message}</strong><br>"
    end

    # redirect_to root_path
  end

end