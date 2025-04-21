class DummyProducts {
  static final List<Map<String, Object>>
  dummyProducts = List<Map<String, Object>>.generate(
    21,
    (int index) => <String, Object>{
      'title': 'Product $index',
      'brand': 'Brand $index',
      'price': 20.toDouble(),
      'description':
          "A lot to say about this product, but this is dummy for now, don't worry about the description, we can get it from the api",
      'rating': 5,
      'image': 'https://picsum.photos/seed/product$index/200/300',
    },
  );

  static final List<String> gadgetCategories = <String>[
    "All",
    "Laptops",
    "Tablets",
    "Wearables",
    "Gaming Consoles",
    "Smart Home",
    "Audio Devices",
    "Drones",
    "Cameras",
  ];
}
