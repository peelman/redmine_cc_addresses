# Extension to ViewListener to allow an :if parameter to render_on.
# See <http://www.redmine.org/boards/3/topics/show/4316>
module Redmine
  module Hook
    class ViewListener
      def self.render_on(hook, options={})
        define_method hook do |context|
          if !options.include?(:if) || evaluate_if_option(options[:if], context)
            context[:controller].send(:render_to_string, {:locals => context}.merge(options))
          end
        end
      end

      private

      def evaluate_if_option(if_option, context)
        case if_option
        when Symbol
          send(if_option, context)
        when Method, Proc
          if_option.call(context)
        end        
      end
    end
  end
end

class ShowCcAddressesHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_description_bottom, :partial => "issues/cc_addresses", :if => :has_permission?
  render_on :view_issues_form_details_bottom, :partial => "issues/cc_addresses/new"

private
  def protect_against_forgery?
    false
  end

  def can_view_cc_addresses?(context)
    context[:project].module_enabled?('cc_addresses') and User.current.allowed_to?(:view_cc_addresses, context[:project])
  end

  def can_add_cc_addresses?(context)
    context[:project].module_enabled?('cc_addresses') and User.current.allowed_to?(:add_cc_addresses, context[:project])
  end
end
