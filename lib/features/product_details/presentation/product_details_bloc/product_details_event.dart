sealed class ProductDetailsEvent {}

class GetProductDetailsEvent extends ProductDetailsEvent {
  GetProductDetailsEvent(this.id);
  final int id;
}
