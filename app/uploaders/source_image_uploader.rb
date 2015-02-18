# encoding: utf-8

class SourceImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :convert_to_pnm
  process :convert_to_svg

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def filename
    "#{model.class.to_s}_#{Date.today}.svg"
  end

  private

  def convert_to_pnm
    manipulate! do |img|
      img.format("pnm") do |c|
        c.threshold("90%")
        c.transparent("white")
      end
      img
    end
  end

  def convert_to_svg
    dir = File.dirname(current_path)
    tmp_file_path = File.join(dir, 'tmp')
    FileUtils.mv(current_path, tmp_file_path)
    system("potrace -s -t 20 --tight #{tmp_file_path} -o #{current_path}")
    FileUtils.remove(tmp_file_path)
  end
end
