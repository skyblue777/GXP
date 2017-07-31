class Product < ActiveRecord::Base
  MAX_IMAGE_SIZE = 5.megabytes
  has_one :book_type
  has_many :product_prices
  has_many :order_products
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :price, numericality: true
  attachment :image, extension: %w(jpg jpeg png gif)
  attachment :book_download

  validates_presence_of :image_filename, :image
  validate :cannot_attach_files_that_are_too_large

  private

    def cannot_attach_files_that_are_too_large
      errors.add :image, (I18n.t 'activerecord.errors.models.image.attributes.image.too_large') if (image && image.size && image.size > MAX_IMAGE_SIZE)
    end
end
