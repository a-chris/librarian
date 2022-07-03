require 'fileutils'

DIRS = {
  'Apps' => %w[dmg exe],
  'Books' => %w[epub],
  'Documents' => %w[pdf html doc docx],
  'Data' => %w[xls xlsx csv md json],
  'Videos' => %w[mp4 flv mkv avi],
  'Images' => %w[png jpg jpeg webp bmp],
  'Archives' => %w[zip tg gz rar 7z]
}.freeze

current_dir = Dir.new('.')
DIRS.each do |k, v|
  Dir.mkdir(k) unless File.exist?(k)
  current_dir.children.each do |file|
    # .filter { |f| v.any? { |ext| f.end_with?(ext) } }
    FileUtils.mv(file, k) if v.include?(File.extname(file).tr('.', ''))
  end
end
