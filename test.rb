require_relative 'script'

FILES_TO_CREATE = %w[video.mp4 image.png doc.docx books.epub file.zip app.dmg table.csv].freeze

def delete_dirs
  DIRS.each_key { |dir| FileUtils.rm_rf(dir) }
end

delete_dirs

FILES_TO_CREATE.each do |file|
  File.new(file, 'w+') unless File.exist?(file)
end

`ruby script.rb`

DIRS.each_key do |dir|
  raise StandardError, "Error with directory #{dir}" if Dir.new(dir).children.size != 1
end

delete_dirs

puts 'Everything is working!'
