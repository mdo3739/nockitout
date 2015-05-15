class UserPolicy < ApplicationPolicy
	def show?
		record.user == user || user.admin?
	end
end