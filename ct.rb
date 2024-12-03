def generate_cutter_table
  puts "Enter the title of the book:"
  title = gets.chomp
  puts "Enter the author's name:"
  author = gets.chomp

  cutter_number = get_cutter_number(author)
  cutter = "#{author[0].upcase}#{cutter_number}#{title[0].upcase}"
  puts "Cutter Table: #{cutter}"
end

def get_cutter_number(author)
  normalized_name = normalize_name(author)
  first_letter = normalized_name[0].downcase
  cutter = ''

  if normalized_name.length > 1
    if ['a', 'e', 'i', 'o', 'u'].include?(first_letter)
      cutter = normalized_name[0..1].upcase + "123"
    elsif first_letter == 's' && normalized_name[1] != 'c'
      cutter = normalized_name[0..1].upcase + "123"
    elsif first_letter == 's' && normalized_name[1] == 'c'
      cutter = normalized_name[0..2].upcase + "123"
    else
      cutter = normalized_name[0].upcase + "123"
    end
  else
    cutter = normalized_name[0].upcase + "123"
  end

  cutter.gsub!("0", "")
  cutter
end

def normalize_name(name)
  name = name.gsub(/[áàäâ]/i, 'a')
             .gsub(/[éèëê]/i, 'e')
             .gsub(/[íìïî]/i, 'i')
             .gsub(/[óòöô]/i, 'o')
             .gsub(/[úùüû]/i, 'u')
             .gsub(/[ñ]/i, 'n')
  name.strip
end

generate_cutter_table
