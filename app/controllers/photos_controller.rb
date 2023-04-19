class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ created_at: :desc })

    render({ template: "photo_templates/index.html.erb"})
  end

  def show

    photo_id = params.fetch("path_photo")

    @photo = Photo.where({ id: photo_id }).first

    matching_comments = Comment.all

    @list_of_comments = Comment.where({ photo_id: photo_id})

    if @photo == nil
      redirect_to("/404")
    else
    render({ template: "photo_templates/show.html.erb" })
    end

    def destroy
      the_id = params.fetch("path_id")

      matching_pictures = Photo.where({ id: the_id})

      the_picture = matching_pictures.first

      the_picture.destroy

      #render({ template: "photo_templates/destroy.html.erb" })

      redirect_to("/photos")
    end
  end
end
