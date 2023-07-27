# class UserPolicy < ApplicationPolicy
#   def reset_password? = @current_user.role.admin?

#   def edit? = @current_user.actor_type.admin? || same_user?

#   def update? = @current_user.role.admin? || same_user?

#   def destroy? = @current_user.role.admin? || same_user?

#   private

#   def same_user?
#     @current_user.id == @resource.id
#   end
# end
