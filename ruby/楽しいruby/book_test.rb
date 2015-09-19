require './book_cmp.rb'

ary = []
ary << Book.new("Software", "Rucker", "SF")
ary << Book.new("BABEL-17", "Delany", "SF")
ary << Book.new("Programin Perl", "Wall", "Computer")
ary << Book.new("Programing Pearls", "Bentley", "Computer")

ary.sort.each do |book|
  printf "%-10s %-20s %s\n",book.genre, book.title, book.author
end
