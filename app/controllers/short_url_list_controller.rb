class ShortUrlListController < ApplicationController
  def show
    short_url = ShortUrlList.where.not(link_id: nil).find_by(short_url: params[:id])

    if short_url
      redirect_to short_url.link.original_url
    else
      render json: { messeges: ['Link not found'] }, status: :not_found
    end
  end
end
