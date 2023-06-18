class Book {
  final String isbn;
  final int price;
  final String cover;
  final String title;
  final List<String> synopsis;

  const Book({
    required this.isbn,
    required this.price,
    required this.cover,
    required this.title,
    required this.synopsis,
  });

  @override
  bool operator ==(Object other) =>
      other is Book && other.runtimeType == runtimeType && other.isbn == isbn;

  @override
  int get hashCode => isbn.hashCode;

  Map<String, dynamic> toMap(int quantity) {
    return {"isbn": isbn, "quantity": quantity};
  }
}
