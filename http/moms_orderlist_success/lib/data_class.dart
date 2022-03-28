class Data {
  final int productId;
  final int m_Id;
  final String productName;
  final String category;
  final int price;
  final int offerPrice;
  final productImage;
  final String productQuantity;
  final String quantityType;
  final String dateOfExpair;
  final String description;

  Data({
    required this.productId,
    required this.m_Id,
    required this.productName,
    required this.category,
    required this.price,
    required this.offerPrice,
    required this.productImage,
    required this.productQuantity,
    required this.quantityType,
    required this.dateOfExpair,
    required this.description,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) {
    return Data(
        productId: json['p_id'],
        m_Id: json['m_id'],
        productName: json['p_name'],
        category: json['category'],
        price: json['price'],
        offerPrice: json['offerprice'],
        productImage: json['p_image'],
        productQuantity: json['product_quantity'],
        quantityType: json['quantity_type'],
        dateOfExpair: json['date_of_expiry'],
        description: json['description']);
  }
}
