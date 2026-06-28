class AppTransaction {
  final String id;
  final String personId;
  final String description;
  final double amount;
  final DateTime date;
  final bool isTilgung;

  AppTransaction({
    required this.id,
    required this.personId,
    required this.description,
    required this.amount,
    required this.date,
    this.isTilgung = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'personId': personId,
    'description': description,
    'amount': amount,
    'date': date.toIso8601String(),
    'isTilgung': isTilgung,
  };

  factory AppTransaction.fromJson(Map<String, dynamic> json) {
    return AppTransaction(
      id: json['id']?.toString() ?? '',
      personId: json['personId']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      date: DateTime.parse(json['date']?.toString() ?? DateTime.now().toIso8601String()),
      isTilgung: json['isTilgung'] == true || json['isTilgung'] == 'true',
    );
  }
}
