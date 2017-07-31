class RemoveImageCropCoordinatesFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :image_crop_coordinates, :string
  end
end
