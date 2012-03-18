require 'redmine'
require "#{File.dirname(__FILE__)}/lib/link_creator"

Redmine::Plugin.register :redmine_top_bar_links do
  name 'Redmine Top Bar Links plugin'
  author 'Eugene Sypachev'
  description 'Adds links from configuration file to Redmines top bar'
  version '0.1'
  url 'https://github.com/Axblade/redmine_top_bar_links'
  author_url 'https://github.com/Axblade'

  Redmine::MenuManager.map :top_menu do |menu|
    RedmineTopBarLinks::LinkCreator.link_list.each do |key, value|
      menu.push key.to_sym, value, :if => Proc.new { User.current.logged? }
    end
  end
end
