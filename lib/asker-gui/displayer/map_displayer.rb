
module MapDisplayer
  def self.show(map)
    puts "Concepts : #{map.concepts.size}"
    puts "Codes    : #{map.codes.size}"
  end
end
