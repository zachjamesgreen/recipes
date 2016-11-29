class Recipe < ApplicationRecord
  belongs_to :user
  # has_many :pictures
  has_many :favorites
  has_many :comments

  mount_uploaders :pictures, PictureUploader

  def delete_image(picture_file)
    picture_to_delete = self.pictures.select do |picture| # find the picture based on file name
      picture.file.filename == picture_file
    end
    if picture_to_delete && picture_to_delete[0] # delete the picture that was found
      self.pictures = self.pictures - [picture_to_delete[0]]
      if self.pictures.empty? && read_attribute(:pictures).size == 1 # update the internal attribute
        write_attribute(:pictures, [])
      end
      picture_to_delete[0].remove! # delete from the file system
      save! # save the updated images attribute
    end
  end
end
