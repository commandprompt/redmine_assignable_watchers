require 'redmine'

Redmine::Plugin.register :redmine_assignable_watchers do
  name 'Redmine Assignable Watchers plugin'
  author 'Eugene Dubinin <eugend@commandprompt.com>'
  author_url 'https://www.commandprompt.com'
  description 'Allows assigning the issues to any of its watchers'
  version '0.3.0'
  requires_redmine :version_or_higher => '5.0'
  url 'https://github.com/commandprompt/redmine_assignable_watchers'
end

Issue.send(:include, RedmineAssignableWatchers::IssuePatch)
