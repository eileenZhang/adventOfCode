

def parse(line)
    line = line.split(" ")
    type = line[0].tosym
end

operations = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    operations << parse[]
  end
end