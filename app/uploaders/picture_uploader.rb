class PictureUploader
  class << self
    require 'securerandom'

    def process(image, picture)
      @picture = picture

      ap "Uploading file '#{image.path}'"
      filename = SecureRandom.uuid

      image = MiniMagick::Image.open(image.path)
      image.format "png"
      image.write "public/uploads/#{filename}.png"

      @picture.filename = "#{filename}"
      @picture.ext = "png"

      if @picture.save
        create_thumb
        create_medium
      end

    end

    def create_thumb
      ap "Creating Thumb #{@picture}"
      image = MiniMagick::Image.open("public/uploads/#{@picture.filename}.#{@picture.ext}")
      image.resize "200x200"
      image.write "public/uploads/#{@picture.filename}_thumb.png"
    end

    def create_medium
      image = MiniMagick::Image.open("public/uploads/#{@picture.filename}.#{@picture.ext}")
      image.resize "400x400"
      image.write "public/uploads/#{@picture.filename}_medium.png"
    end

  end
end
