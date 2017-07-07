require "google_drive"

session = GoogleDrive::Session.from_config("client_secret.json")
# create file
puts "select a file by typing the name of one from this list"

files = Dir.glob("*")
puts files

selection = gets.chomp
file_name = Time.new

file = session.upload_from_file(selection, file_name, convert: false)
#put file into folder
puts "Name your folder:"
folder_name = gets.chomp

existent_folders = session.root_collection.subcollections
found = session.root_collection.subcollection_by_title(folder_name)

if found
  found.add(file)
else
  folder = session.root_collection.create_subcollection(folder_name).add(file)
end
