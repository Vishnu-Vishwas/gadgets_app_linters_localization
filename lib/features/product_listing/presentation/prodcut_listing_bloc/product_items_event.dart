sealed class ProductListingEvent {}

class GetAllProductsEvent extends ProductListingEvent {}

class SearchProductsEvent extends ProductListingEvent {
  SearchProductsEvent(this.query);
  final String query;
}
