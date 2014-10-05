# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  #  @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def initialize
    @data = []
  end

  def take_tsv(tsv)
    @data = []
    head = []
    dhash = {}

    ar = tsv.split("\n")
    head = ar[0].split("\t")
    ar.delete_at(0)

    ar.map { |ln| x = ln.split("\t"); dhash = Hash[head.zip x]; @data << dhash }
  end

  def to_tsv
    output = @data[0]
    first_element = output[0].keys
    final_output = ''
    first_element.each { |x| final_output.concat(x + "\t") }
    final_output.chomp!("\t") << "\n"
    output.each do |y|
      y.each_value { |line| final_output.concat(line + "\t") }
      final_output.chomp!("\t") << "\n"
    end
    final_output
  end
end
