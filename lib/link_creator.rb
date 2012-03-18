require 'yaml'

module RedmineTopBarLinks
  class LinkCreator
    def self.link_list
      list = {}
      yml = YAML.load_file "#{File.dirname(__FILE__)}/../config.yml"
      yml.each_key { |key|
        if key == 'link'
          name = yml[key]['name']
          link = yml[key]['path']
          list[name] = link
        end
      }
      list
    end
  end
end