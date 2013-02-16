require './product'

class Book
  
  include Product
  extend Product

  attr_reader :subtitle, :pages, :spineThickness

  def initialize(name, sku, sellable, language, version)
  	super(name, sku, sellable, language)
  	@version = version
    @interiorGSM = 75 # Weight of interior paper in GSM
  #	self.pages = 0
  #	self.setXeroxFee
  end
  def subtitle=(subtitle)
    @subtitle = subtitle
  end
  def spineThickness
      @spineThickness = ((((10 / 176) * @pages) / 90) * @interiorGSM) + 4 #thickness in millimeters
  end
=begin
  def setPageCount(pages=0)
  	@pages = pages
  	@leaves = ((@pages.to_f / 2).ceil)
  end
=end
  def pages=(pages)
    @pages = pages
    @leaves = ((@pages.to_f / 2).ceil)
  end
=begin
  def setXeroxFee(blackAndWhite=0.0322, color=0.1111) #these arguments are both per LEAF, not per PAGE
  	xeroxFeeBW = @leaves * blackAndWhite
    xeroxFeeColor = color
    @xeroxFee = xeroxFeeBW + xeroxFeeColor
  end
  def productionCost
    interiorPaperCost = @leaves * 0.0138
    coverPaperCost = 0.142725
    binding = 4.99
    @totalCost = (@xeroxFee + interiorPaperCost + coverPaperCost + binding).round(2)
  end
=end

end