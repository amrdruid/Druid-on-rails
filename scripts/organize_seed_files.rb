#Organize your seed files
#You will not need to include your files in the seed file anymore, you can use this convention to run your files in specific order
#In seed Folder: 01_users.rb - 02.model1.rb - 03.model3.rb
#And the line blow will sort them and load each file

puts "Running seeds"
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
puts "Done"
