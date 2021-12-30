
module MapDisplayer
  def self.show(map)
    puts "Concepts : #{map.concepts.size}"
    puts "Codes    : #{map.codes.size}"

    map.concepts.each { |concept| show_concept(concept) }
  end

  def self.show_concept(concept)
    puts "concept"
    puts "  names: #{concept.names}"
    puts "  tags : #{concept.tags}"
    concept.defs.each do |d|
      puts "  def {type: #{d.type}} : #{d.value}"
    end
    concept.tables.each do |t|
      puts "  table {fields: #{t.fields}, sequence: #{t.sequence}"
    end
  end


end
