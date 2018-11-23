module RedmineAssignableWatchers
  module IssuePatch
    unloadable

    def self.included(base)
      base.class_eval do
        alias_method_chain :assignable_users, :watchers_added
      end
    end

    def assignable_users_with_watchers_added
      assignables = assignable_users_without_watchers_added
      assignables += watchers.map(&:user)
      assignables.sort.uniq
    end
  end
end