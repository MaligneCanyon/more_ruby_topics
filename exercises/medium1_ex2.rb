class TextAnalyzer
  def process
    filename = 'medium1_ex2.txt'
    if File.exist?(filename)
      # puts "opening the file"
      f = File.open(filename, 'r')
      # puts "reading the file"
      str = f.read
    else
      str = <<~TEXT
      Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
      enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
      aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
      nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
      sit consequat cupidatat.

      Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
      aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
      pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
      elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
      aliqua ea sunt ex nisi non.

      Officia dolore labore non labore irure nisi ad minim consectetur non irure
      veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
      commodo.
      TEXT
    end

    yield(str) # 'sandwich' this btwn the file open and close

    if f
      # puts "closing the file"
      f.close
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |str| puts "#{str.split("\n\n").count} paragraphs" }
analyzer.process { |str| puts "#{str.split("\n").count} lines" }
analyzer.process { |str| puts "#{str.split.count} words" }
# 3 paragraphs
# 15 lines
# 126 words
