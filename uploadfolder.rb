require "google_drive"

session = GoogleDrive::Session.from_config("client_secret.json")
#create folder
puts "Name your folder:"
folder_name = gets.chomp
folder = session.root_collection.create_subcollection(folder_name)
# create file
file_name = Time.new

puts "select a file by typing the name of one from this list"

basedir = 'uploads'

files = Dir.glob("#{basedir}/*")

puts files

selection = gets.chomp

file = session.upload_from_file(selection, file_name, convert: false)
#put file into folder
folder.add(file)