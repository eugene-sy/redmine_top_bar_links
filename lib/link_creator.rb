require 'yaml'

module RedmineTopBarLinks
  class LinkCreator
    def self.link_list
      list = {}
      yml = YAML.load_file "#{File.dirname(__FILE__)}/../config.yml"
      yml.each_pair { |key, value|
        list[key] = value
      }
      list
    end
  end
end