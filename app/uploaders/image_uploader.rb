class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fit: [1920, 1080]

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
