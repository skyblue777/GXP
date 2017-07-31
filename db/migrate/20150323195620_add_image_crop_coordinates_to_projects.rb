class AddImageCropCoordinatesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image_crop_coordinates, :string
  end
end
