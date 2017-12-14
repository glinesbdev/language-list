json.array! @users do |user|
	json.user user.to_builder
end