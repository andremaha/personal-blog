module Admin
  class SitesController < BaseController
    before_action :set_site

    def edit
    end

    def update
      if @site.update(site_params)
        redirect_to edit_admin_site_path, notice: "Site info updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_site
      @site = Site.current
    end

    def site_params
      params.require(:site).permit(:title, :tagline, :meta_description)
    end
  end
end
