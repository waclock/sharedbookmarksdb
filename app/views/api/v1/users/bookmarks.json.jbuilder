json.groups @user.get_all_groups do |group|
	json.(group, :name)
	json.folders group.folders do |folder|
		json.(folder, :name)
		json.bookmarks folder.bookmarks do |bookmark|
			json.(bookmark,:name,:link)
		end
	end
end