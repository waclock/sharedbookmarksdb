
json.groups @user.groups do |json, group|
	json.(group, :name)
	json.folders group.folders do |json, folder|
		json.bookmarks folder.bookmarks do |json, boomark|
			json.(bookmark,:name,:link)
		end
	end
end