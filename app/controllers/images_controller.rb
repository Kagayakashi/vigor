class ImagesController < ApplicationController
  before_action :set_image_category
  before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = @image_category.images.build
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    errors = []

    images_params[:images].each do |image|
      @image = @image_category.images.build(image: image)
      resize_image if @image.image.attached?

      unless @image.save
        errors << @image.errors.full_messages
      end
    end

    respond_to do |format|
      if errors.empty?
        format.html { redirect_to image_category_path(@image_category), notice: "Images were successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to image_category_image_url(@image_category, @image), notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy!

    respond_to do |format|
      format.html { redirect_to image_category_images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image_category
    @image_category = ImageCategory.find(params[:image_category_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def images_params
    params.require(:image).permit(:image_category_id, images: [])
  end

  # Resize attached image if width or height is more, not less
  def resize_image
    # Todo
    return
    image = MiniMagick::Image.read(@image.image.download)
    image.resize_to_fit(800, 800)
    @image.image.attach(io: File.open(image.tempfile), filename: @image.image.filename.base.to_s)
  end
end
