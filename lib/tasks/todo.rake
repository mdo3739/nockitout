namespace :todo do
  desc "Delete items older than 7 days, and archive completed items older than 7 days"
  task delete_items: :environment do
  	Item.where("created_at <= ?", Time.now - 7.days).each {|item| item.update_attribute(:archive, true)}
  	Item.all.each do |item| 
  		if (item.completed == true && (Time.now - item.updated_at >= 7.days))
  			item.update_attributes(archive: true)
  		end
  	end
  end

end
