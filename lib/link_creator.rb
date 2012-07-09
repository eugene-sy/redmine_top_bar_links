require 'yaml'

module RedmineTopBarLinks
  class LinkCreator
    def self.link_list
      list = {}
      yml = YAML.load_file "#{File.dirname(__FILE__)}/../config.yml"
      yml.each_key do |key|
        if key.match /^link/ui
          name = yml[key]['name']
          link = yml[key]['path']
          puts "#{name}, #{link} \n"
          list[name] = link
        end
      end
      list
    end
  end
end