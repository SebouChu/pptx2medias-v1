puts "PPTX to Medias by SebouChu"
puts "========================="

file_path = ARGV[0]
file_type = `file -b "#{file_path}"`
file_ext = File.extname(file_path)

puts "- Input file: #{file_path}"
puts "- File type: #{file_type}"

unless file_type.include?('PowerPoint') && file_ext == '.pptx'
  puts 'Input file is not a valid PPTX. Exiting...'
  exit()
end

puts 'Input file is a PowerPoint presentation. Processing...'

dir = File.dirname(file_path)
basename = File.basename(file_path, file_ext)

system("cp \"#{file_path}\" \"#{dir}/archive.zip\"")
system("unzip \"#{dir}/archive.zip\" ppt/media/* -d #{dir}")
system("mv \"#{dir}/ppt/media\" \"#{dir}/#{basename}_media\"")

medias_count = `ls -1 \"#{dir}/#{basename}_media\" | wc -l`.strip.to_i
videos_count = `ls -1 \"#{dir}/#{basename}_media\" | grep .mp4 | wc -l`.strip.to_i

puts "File has been processed. Found #{medias_count} medias (including #{videos_count} videos). Cleaning..."

system("rmdir \"#{dir}/ppt\"")
system("rm \"#{dir}/archive.zip\"")

puts "Done!"
