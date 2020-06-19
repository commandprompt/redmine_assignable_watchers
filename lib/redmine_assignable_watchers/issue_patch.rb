module RedmineAssignableWatchers
  module IssuePatch
    unloadable

    def self.included(base)
      base.class_eval do
        alias_method :assignable_users_without_watchers_added, :assignable_users
        alias_method :assignable_users, :assignable_users_with_watchers_added
      end
    end

    def assignable_users_with_watchers_added
      assignables = assignable_users_without_watchers_added
      assignables += watchers.map(&:user)
      assignables.sort.uniq
    end
  end
end