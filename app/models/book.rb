class Book < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true,
    length: { minimum: 1 }
  validates :body, presence:{ minimum: 1, maximum: 200 }
   
  belongs_to :user
 
  
  def get_image(width,heigth)
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
