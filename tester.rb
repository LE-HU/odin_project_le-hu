puts Dir.glob("/home/le-hu/Downloads/*").length
puts Dir.glob("/home/le-hu/Downloads/*.{pdf,PDF}").join(",\n")
