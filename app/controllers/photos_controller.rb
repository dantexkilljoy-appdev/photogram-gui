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
  end
    def destroy
      the_id = params.fetch("path_id")

      matching_pictures = Photo.where({ id: the_id})

      the_picture = matching_pictures.first

      the_picture.destroy

      #render({ template: "photo_templates/destroy.html.erb" })

      redirect_to("/photos")
    end

    def create

      fetched_image = params.fetch("input_image")
      fetched_caption = params.fetch("input_caption")
      fetched_id = params.fetch("input_owner_id")

      a_new_photo = Photo.new
      a_new_photo.image = fetched_image
      a_new_photo.caption = fetched_caption
      a_new_photo.owner_id = fetched_id

      a_new_photo.save

      #render({ template: "photo_templates/create.html.erb" })

      redirect_to("/photos/" + a_new_photo.id.to_s)
    end
end
