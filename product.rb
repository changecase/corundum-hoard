class Product
  attr_reader :name, :sku, :language, :price
  def initialize(name, sku, sellable, language)
  	@name = name
  	@sku = sku
  	@sellable = sellable
  	@language = language
  end
  def setPrice(sellingPrice)
  	if @sellable === true && sellingPrice.is_a?(Float)
  	  sellFor = sellingPrice
  	elsif @sellable === true && sellingPrice.is_a?(Integer)
  	  sellFor = sellingPrice.to_f
  	end
  	sellFor ? @price = sellFor.round(2) : return
  end
  def removePrice
  	@price = nil
  end

end