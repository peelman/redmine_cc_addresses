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
  render_on :view_issues_show_description_bottom, :partial => "issues/cc_addresses", :if => :can_view_cc_addresses?
  render_on :view_issues_form_details_bottom, :partial => "issues/cc_addresses/new", :if => :can_add_cc_addresses?

  def controller_issues_new_prepare(context = {})
    num_cc_fields = (context[:params][:num_cc_fields].to_i != 0) ? context[:params][:num_cc_fields].to_i : 1
    if (can_add_cc_addresses?(context))
      num_cc_fields.times do
        context[:issue].cc_addresses.build
      end
    end
  end
    
private
  def protect_against_forgery?
    false
  end

  def can_view_cc_addresses?(context)
    context[:project].module_enabled?('cc_addresses') and User.current.allowed_to?(:view_cc_addresses, context[:project])
  end

  def can_add_cc_addresses?(context)
    context[:project].module_enabled?('cc_addresses') and User.current.allowed_to?(:add_cc_addresses, context[:project]) and context[:issue].new_record?
  end  
end
