require "google_drive"

session = GoogleDrive::Session.from_config("client_secret.json")

file = session.file_by_title("hello.txt")

if file == nil
	puts "no such file"
	return
end

file.download_to_file("downloads/bye.txt") 

