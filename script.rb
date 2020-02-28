puts "PPTX to Medias by SebouChu"
puts "========================="

input_file = ARGV[0]
file_type = `file -b #{input_file}`
file_ext = File.extname(input_file)

puts "- Input file: #{input_file}"
puts "- File type: #{file_type}"

unless file_type.include?('PowerPoint') && file_ext == '.pptx'
  puts 'Input file is not a valid PPTX. Exiting...'
  exit()
end

puts 'Input file is a PowerPoint presentation. Processing...'

dir = File.dirname(input_file)
basename = File.basename(input_file, file_ext)

system("cp #{input_file} #{dir}/archive.zip")
system("unzip #{dir}/archive.zip ppt/media/* -d #{dir}")
system("mv #{dir}/ppt/media #{dir}/#{basename}_media")

medias_count = `ls -1 #{dir}/#{basename}_media | wc -l`.strip.to_i
videos_count = `ls -1 #{dir}/#{basename}_media | grep .mp4 | wc -l`.strip.to_i

puts "File has been processed. Found #{medias_count} medias (including #{videos_count} videos). Cleaning..."

system("rmdir #{dir}/ppt")
system("rm #{dir}/archive.zip")

puts "Done!"
