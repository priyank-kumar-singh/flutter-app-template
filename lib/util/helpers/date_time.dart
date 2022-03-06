import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

abstract class DateTimeHelper {
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat().format(dateTime);
  }

  static String timestampToReadable(Timestamp timestamp) {
    return DateFormat().format(timestamp.toDate());
  }
}
