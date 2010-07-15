module RedmineCcAddresses
  # Patches Redmine's Mailer Model dynamically
  module MailerPatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.send(:include, MailerInstanceMethods)
      base.class_eval do
        alias_method_chain :issue_edit, :cc_addresses
        alias_method_chain :issue_add, :cc_addresses
      end
    end
  end

  module MailerInstanceMethods
    def issue_edit_with_cc_addresses(journal)
      issue = journal.journalized.reload
      issue_edit_without_cc_addresses(journal)
      cc_addresses = issue.cc_addresses.collect {|m| m.mail}
      cc << cc_addresses
    end
    def issue_add_with_cc_addresses(issue)
      issue_add_without_cc_addresses(issue)
      cc_addresses = issue.cc_addresses.collect {|m| m.mail}
      cc << cc_addresses
    end
  end
end
