class TransactionModel {
  final String brand;
  final String status;
  final double amount;
  final String date;
  final bool isPositive;

  TransactionModel(
      this.brand, this.status, this.amount, this.date, this.isPositive);
}
