
class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

final List<Product> products = [
  Product(name: 'Shoes', price: 29.99, imageUrl: 'lib/assets/001.jpg'),
  Product(name: 'Accessories', price: 49.99, imageUrl: 'lib/assets/002.jpg'),
  Product(name: 'Bottles', price: 4.99, imageUrl: 'lib/assets/003.jpg'),
  Product(name: 'Fashion Bags', price: 9.99, imageUrl: 'lib/assets/005.jpg'),
  Product(name: 'Fashion Bags', price: 59.99, imageUrl: 'lib/assets/004.jpg'),
  Product(name: 'Accessories', price: 7.99, imageUrl: 'lib/assets/006.jpg'),
];
