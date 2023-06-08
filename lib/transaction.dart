//Data for to get he List values
class Transaction {
  final String id; //Unique identifier
  final String title; //title of the expense
  final double amount; //Amount in the Expense
  final DateTime dateTime; // Date and time of the transaction
//Constructor
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.dateTime});
}
