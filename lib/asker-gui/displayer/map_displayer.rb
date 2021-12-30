
module MapDisplayer
  def self.show(map)
    puts '='*40
    puts "Concepts : #{map.concepts.size}"
    puts "Codes    : #{map.codes.size}"
    map.concepts.each { |concept| show_concept(concept) }
    map.codes.each { |code| show_code(code) }
  end

  def self.show_concept(concept)
    puts ''
    puts "concept"
    puts "  names: #{concept.names}"
    puts "  tags : #{concept.tags}"
    concept.defs.each do |d|
      if d.type.size.zero?
        puts "  def  : #{d.value}"
      else
        puts "  def {type: #{d.type}} : #{d.value}"
      end
    end
    concept.tables.each do |t|
      puts "  table {fields: #{t.fields}, sequence: #{t.sequence}"
    end
  end

  def self.show_code(code)
    puts ''
    puts "code"
    puts "  path : #{code.path}"
    puts "  type : #{code.type}"
    unless code.features.size.zero?
      puts "  features"
      code.features.each do |value|
        puts "    row : #{value}"
      end
    end
  end

end
