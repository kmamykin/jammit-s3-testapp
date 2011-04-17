desc "Regenerate test image with the current time"
task :update_images do
  time = `date "+%H:%M:%S"`.chomp
  image_path = "public/images/timestamp.gif"
  system %Q(convert -background lightblue -fill blue -size 165x50 label:'#{time}' #{image_path}) or raise "Can't generate image. ImageMagick not installed?"
  puts "Generated #{image_path} with '#{time}'"
  %W(public/stylesheets/ public/stylesheets/img/ public/images/embedded/).each do |dir|
    cp image_path, dir, :verbose => true
  end
end
