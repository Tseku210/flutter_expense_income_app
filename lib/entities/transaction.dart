class Transaction {
  final String id;
  final String title;
  final String image;
  final bool income;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.image,
    required this.income,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'income': income,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
