import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  String convertTimestampToReadable(Timestamp timestamp) {
    return DateFormat().format(timestamp.toDate());
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat().format(dateTime);
  }
}
