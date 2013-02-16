require './product/book'

class Catalogue
  
#  include Book

  attr_reader :books
  def initialize
  	bookDB = File.open("./product/book.txt", "r")
  	@books = {}
  	bookDB.each_line do |line|
  	  lineArray = line.split(/,\s+/)
  	  bookSKU = lineArray[1].to_sym
  	  @books[bookSKU] = Book.new(	lineArray[0].to_s, 
  	  								lineArray[1].to_s, 
  	  								lineArray[2].downcase == "true" ? true : false, 
  	  								lineArray[3].to_s, 
  	  								lineArray[5].to_f
  	  							)
  	  lineArray[4].empty? == false ? @books[bookSKU].subtitle = lineArray[4].to_s : false	# add a subtitle to the book, if one exists
  	  @books[bookSKU].pages = lineArray[6].to_i												# set the book pagecount
  	end
  end
  def book(sku)
  	return @books[sku.to_sym]
  end
end