class LinksController < ApplicationController
  def create
    link = Link.find_by_original_url(new_link_params[:url]) || Link.new(original_url: new_link_params[:url])
    user = User.find_by_id(new_link_params[:id])

    if user
      user.links << link
      short_url_list = ShortUrlList.find_by_link_id(nil)
      short_url_list.update(link_id: link.id)

      render json: { messages: [return_url(short_url_list)] }, status: :created
    else
      render json: { message: ['incorrect params'] }, status: :unprocessable_entity
    end
  end

  private

  def new_link_params
    params.permit(:id, :url)
  end

  def return_url(short_url_list)
    'localhost:3000/' + short_url_list.short_url
  end
end
