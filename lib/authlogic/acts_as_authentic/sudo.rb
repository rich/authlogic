module Authlogic
  module ActsAsAuthentic
    # Sometimes models won't have an explicit "login" or "username" field. Instead they want to use the email field.
    # In this case, authlogic provides validations to make sure the email submited is actually a valid email. Don't worry,
    # if you do have a login or username field, Authlogic will still validate your email field. One less thing you have to
    # worry about.
    module Sudo
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      # Configuration to modify how Authlogic handles the email field.
      module Config
        # Toggles whether or not superusers can login as any other user
        # 
        # * <tt>Default:</tt> false
        # * <tt>Accepts:</tt> Boolean
        def allow_sudo(value = false)
          rw_config(:allow_sudo, value, false)
        end
        alias_method :allow_sudo=, :allow_sudo
        alias_method :allow_sudo?, :allow_sudo
        
        # The name of the method called to determine if a user is a super user
        # 
        # * <tt>Default:</tt> :is_superuser?
        # * <tt>Accepts:</tt> Symbol
        def sudo_check(value = nil)
          rw_config(:sudo_check, value, :is_superuser?)
        end
        alias_method :sudo_check=, :sudo_check              
      end
    end
  end
end