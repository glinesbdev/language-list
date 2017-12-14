json.array! @items do |item|
	json.item item.to_builder
end