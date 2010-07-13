module RedmineCcAddresses
  # Patches Redmine's Issues Model dynamically. Adds a relationship
  # Issue +has_many+ to IssueResource
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do
        belongs_to :deliverable
        has_many :cc_addresses, :class_name => 'CcAddress', :foreign_key => 'issue_id', :dependent => :delete_all
      end
    end
  end
end
