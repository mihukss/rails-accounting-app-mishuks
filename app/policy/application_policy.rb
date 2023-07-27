# class ApplicationPolicy
#   class ActionForbidden < StandardError; end

#   def initialize(current_user, resource)
#     @current_user = current_user
#     @resource = resource
#   end

#   def result(action)
#     return if send("#{action}?")

#     raise ActionForbidden
#   end

#   class << self
#     def authorize!(current_user, resource, action)
#       new(current_user, resource).result(action)
#     end
#   end
# end
