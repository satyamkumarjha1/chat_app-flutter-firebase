class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final String timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
    'senderID': senderID,
    'senderEmail': receiverID,
    'receiverID': receiverID,
    'message': message,
    'timestamp': timestamp,
    };
  }
}
