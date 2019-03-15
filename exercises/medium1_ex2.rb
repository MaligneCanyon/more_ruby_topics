class TextAnalyzer
  def process
    filename = 'medium1_ex2.txt'
    if File.exist?(filename)
      # puts "opening the file"
      f = File.open(filename, 'r')
      # puts "reading the file"
      str = f.read
    else
      # puts "creating the file"
      f = File.new(filename, 'w')
      str = ''
    end
    # puts "closing the file"
    f.close
    yield(str) # could 'sandwich' this btwn the file open and close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |str| puts "#{str.split("\n\n").count} paragraphs" }
analyzer.process { |str| puts "#{str.split("\n").count} lines" }
analyzer.process { |str| puts "#{str.split.count} words" }
# 3 paragraphs
# 15 lines
# 126 words
