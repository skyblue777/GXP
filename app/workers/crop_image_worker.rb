class CropImageWorker < ActiveJob::Base

  def perform(record, x, y, w, h)
    cropped_file = nil
    renamed_file = nil
    record.images.each do |image_model|
      file = image_model.image_attacher.get.download
      image = ::MiniMagick::Image.new(file.path)

      x = x.to_f.floor
      y = y.to_f.floor
      w = w.to_f.floor
      h = h.to_f.floor

      image.crop "#{w}x#{h}+#{x}+#{y}"
      cropped_file = File.open image.path, 'rb'
      renamed_file = add_extension_to cropped_file
      image_model.update! image: renamed_file
    end
  ensure
    cropped_file.try :close
    renamed_file.try :close
  end

  private

    def add_extension_to(file, extension = 'png')
      pathname = Pathname.new(file.path)
      new_path = pathname.to_path + ".#{extension}"
      FileUtils.cp file, new_path
      File.open new_path, 'rb'
    end

end
