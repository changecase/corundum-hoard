require './product/book'

class Catalogue
  attr_reader :books
  def initialize
  	bookDB = File.open("./product/book.txt", "r")
  	@books = {}
  	bookDB.each_line do |line|
  	#  @books << line
  	  lineArray = line.split(/,\s+/)
  	  bookSKU = lineArray[1].to_sym
  	  @books[bookSKU] = Book.new(	lineArray[0].to_s, 
  	  								lineArray[1].to_s, 
  	  								lineArray[2].downcase == "true" ? true : false, 
  	  								lineArray[3].to_s, 
  	  								lineArray[4].to_s, 
  	  								lineArray[5].to_f
  	  							)
  	  @books[bookSKU].setPageCount(lineArray[6].to_i)
  	end
 # 	@books.each do |bookTitle, values|
 # 	  bookTitle =  Book.new(values.each)
 # 	end
  	#puts "test"
  end
  def book(sku)
  	return @books[sku.to_sym]
  end
# ====================
# Books
# ====================

  # 2007 editions

  #spfepm2007 = Book.new("SharePoint for Effective Project Management", "spfepm2007", true, "english", '', 1)#.setPageCount(262) 
 # spfepm2007
=begin
  "mpwmp2007"       => Book.new("Managing Projects with Microsoft Project 2007", 326),
  "mops2007:pm"     => Book.new("Microsoft Office Project Server 2007: Project Manager's Guide", 470),
  "mops2007:r&a"    => Book.new("Microsoft Office Project Server 2007: Research and Analysis Guide", 234),
  "mops2007:admin"  => Book.new("Microsoft Office Project Server 2007: Administrator's Guide", 464),
  "mops2007:tm"     => Book.new("Microsoft Office Project Server 2007: Team Member's Guide", 180),
=end
  # 2010 editions
=begin
  "mpwmp2010"       => Book.new("Managing Projects with Microsoft Project 2010", 382), 
  "msps2010:pm"     => Book.new("Microsoft Project Server 2010: Project Manager's Guide", 356),
  "msps2010:admin"  => Book.new("Microsoft Project Server 2010: Administrator's Guide", 412),
  "msps2010:tm"     => Book.new("Microsoft Project Server 2010: Team Member's Guide", 192),
  "bi"              => Book.new("Microsoft Business Intelligence: Building Executive Dashboards", 288),
  "spfetc2010"      => Book.new("SharePoint for Effective Team Collaboration", 302),
=end
  # Spanish
=begin
  "es mops2007:pm"  => Book.new("Microsoft Office Project Server 2007: Guía del Administrador de Proyectos", 414),
  "es mops2007:tm"  => Book.new("Microsoft Office Project Server 2007: Guía del Miembro del Equipo", 134),
  "es ppm"          => Book.new("Administración de Proyectos Práctica", 178),
=end
  # Misc. books
=begin
  "masw"            => Book.new("Microsoft Access in a SharePoint World", 478),
  "mrg"			        => Book.new("Managing Requirements Gathering", 190),
  "ppm"			        => Book.new("Practical Project Management", 206)=end
=end
end