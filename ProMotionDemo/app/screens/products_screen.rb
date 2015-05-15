class ProductsScreen < PM::TableScreen
  def table_data
    [{
      cells: products.map do |product|
        {
          title: product,
          action: :select_product,
          arguments: {product: product}
        }
      end
    }]
  end

  def select_product(product)
    self.parent_screen.select_product(product)
  end

  def products
    [
      "Shopping",
      "Weibo Demo",
      "RoR,Facebook",
      "Chinese To Pinyin",
      "Auto Fill Field",
      "Validate Field",
      "Elasticsearch Search",
      "D3 Virtualization",
      "ES with D3",
      "IOS Map",
      "GEO Server Release Spatial Data"
    ]
  end
end