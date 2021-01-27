class GalleryItem < ApplicationRecord
  
  validates :plot, presence: true
  validates :title, presence: true

end
