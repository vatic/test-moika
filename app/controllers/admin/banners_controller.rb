class Admin::BannersController < AdminController
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :delete_file]
  skip_before_filter :verify_authenticity_token, :only => [:update]

  def index
    @banners = Banner.all
    @banners_left = Banner.left
    @banners_top = Banner.top
    @banners_bottom = Banner.bottom
    @top_text_banner = TextBanner.where(place: 'top').first
  end

  def show
  end

  def new
    @banner = Banner.new
  end

  def edit
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.file = banner_params[:file]
    @banner.save!
      #render :nothing => true
      redirect_to admin_banners_path
  end

  def update
    respond_to do |format|
      if @banner.update(banner_params)
        #format.html { redirect_to [:admin, @banner], notice: 'Banner was successfully updated.' }
        logger.debug(banner_params)
        format.json
        format.js {
          render js: 'var label = $("#top_text_banner form label");
                      var prev_html = label.html();
                      console.log(prev_html);
                      label.html("Обновлено").show("slow").effect("highlight", {color: "#f77"}, 3000);
                      setTimeout(function() {label.html(prev_html);}, 3000);'
        }
      else
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_banners_url }
      format.json { head :no_content }
    end
  end

  def delete_file
    @banner.remove_file!
    @banner.save!
    respond_to do |format|
      format.json { render json: @banner.to_json(only: [:id, :file]) }
    end
  end

  private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params[:banner] ||= {}
      params[:banner][:file] = params[:file]
      params[:banner][:filename] = params[:name]
      params.require(:banner).permit(:file, :filename, :text, :place, :type)
    end

end
