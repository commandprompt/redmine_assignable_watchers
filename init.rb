require 'redmine'

Redmine::Plugin.register :redmine_assignable_watchers do
  name 'Redmine Assignable Watchers plugin'
  author 'Eugene dubinin <eugend@commandprompt.com>'
  author_url 'https://www.commandprompt.com'
  description 'Allows assigning the issues to any of its watchers'
  version '0.1.0'
  requires_redmine :version_or_higher => '3.4'
  url 'https://github.com/commandprompt/redmine_assignable_watchers'
end

prepare_block = Proc.new do
  Issue.send(:include, RedmineAssignableWatchers::IssuePatch)
end

if Rails.env.development?
  ActionDispatch::Reloader.to_prepare { prepare_block.call }
else
  prepare_block.call
end