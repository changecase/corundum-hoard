require './product'

class Book < Product
  
  def initialize(name, sku, sellable, language, subtitle, version)
  	super(name, sku, sellable, language)
  	@subtitle = subtitle
  	@version = version
  	self.setPageCount
  	self.setXeroxFee
  end
  def setPageCount(pages=0)
  	@pages = pages
  	@leaves = ((@pages.to_f / 2).ceil)
  end
  def setXeroxFee(blackAndWhite=0.0322, color=0.1111) #these arguments are both per LEAF, not per PAGE
  	xeroxFeeBW = @leaves * blackAndWhite
    xeroxFeeColor = color
    @xeroxFee = xeroxFeeBW + xeroxFeeColor
  end
  def productionCost
    interiorPaperCost = @leaves * 0.0138
    coverPaperCost = 0.142725
    binding = 4.99
    @totalCost = @xeroxFee + interiorPaperCost + coverPaperCost + binding
  end

end