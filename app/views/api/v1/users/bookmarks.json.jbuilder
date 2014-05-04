json.groups @user.groups do |json, group|
	json.(group, :name)
	json.folders group.folders do |json, folder|
		json.(folder, :name)
		json.bookmarks folder.bookmarks do |json, bookmark|
			json.(bookmark,:name,:link)
		end
	end
end