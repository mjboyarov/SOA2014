require_relative 'tsv_buddy'
require 'yaml'
class FlipFlap
  include TsvBuddy
  # Will take a Yaml string and create a data structure @data
  def take_yaml(yaml)
    @data = YAML.load(yaml)
  end
  # Will return a data structure @data in Yaml format.
  def to_yaml
    @data.to_yaml
  end
end
