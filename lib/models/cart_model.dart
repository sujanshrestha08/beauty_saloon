class Cart {
  late final String? id;
  final String? productId;
  final String? name;
  // final int? initialPrice;

  final String? duration;
  late final int? productPrice;
  final int? quantity;
  final String? unittag;
  final String? image;

  Cart({
    this.id,
    this.productId,
    this.name,
    this.duration,
    this.productPrice,
    this.quantity,
    this.unittag,
    this.image,
  });
  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        name = res['name'],
        duration = res['duration'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        unittag = res['unittag'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'duration': duration,
      'productPrice': productPrice,
      'quantity': quantity,
      'unittag': unittag,
      'image': image
    };
  }
}
