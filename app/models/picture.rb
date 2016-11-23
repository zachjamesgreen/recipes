class Picture < ApplicationRecord
  belongs_to :recipe

  def original
    "#{self.filename}.#{self.ext}"
  end

  def thumb
    "#{self.filename}_thumb.#{self.ext}"
  end

  def medium
    "#{self.filename}_medium.#{self.ext}"
  end
end
