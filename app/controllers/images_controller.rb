class ImagesController < ApplicationController
  def ogp
    text = ogp_params[:text]
    image = OgpCreator.build(text)
    image = OgpCreator.build2(text).tempfile.open.read
    send_data image, :type => 'image/png',:disposition => 'inline'
  end

  def ogp_params
    params.permit(:text)
  end
end