class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include VideoThumbnailer
  storage :file

 
  version :thumb do
    process generate_thumb:[{ :height => "400", :width => "200", :format => "jpg", :file_name => 'test'},"/home/teena/Downloads/video.mp4","/home/teena/Downloads/"]
    def full_filename for_file
      png_name for_file, version_name
    end

  end

 def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.jpg}
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w( mp4 jpg jpeg gif png )
  end

end
