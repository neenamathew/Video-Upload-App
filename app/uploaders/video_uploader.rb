class VideoUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{video.class.to_s.underscore}/#{mounted_as}/#{video.id}"
  end


end
