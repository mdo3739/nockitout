module ApplicationHelper
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def strike_tag
  	print "<s>"
  end

  def flash_notice(message)
    "<div id='flash-notice'class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button>#{message}</div>"
  end
end
