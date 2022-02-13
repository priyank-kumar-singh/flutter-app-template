import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/result.dart';

class URLHelper {
  URLHelper._();

  static Future<Result> launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return Result(code: Status.success);
    } else {
      return Result(
        code: Status.exception,
        message: 'Failed to open required app.',
      );
    }
  }

  static Future<Result> callto(String phone) async {
    var url = 'tel://$phone';
    if (await canLaunch(url)) {
      await launch(url);
      return Result(code: Status.success);
    } else {
      return Result(
        code: Status.exception,
        message: 'Failed to open phone',
      );
    }
  }

  static Future<Result> mailTo({
    required String email,
    required String subject,
    required String body,
  }) async {
    var url = 'mailto:$email?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
      return Result(code: Status.success);
    } else {
      return Result(
        code: Status.exception,
        message: 'Failed to open email.',
      );
    }
  }

  static Future<Result> launchMaps(GeoPoint source, GeoPoint destination) async {
    var url = "http://maps.google.com/maps?saddr=" +
        source.latitude.toString() + "," +
        source.longitude.toString() + "&daddr=" +
        destination.latitude.toString() + "," +
        destination.longitude.toString();
    if (await canLaunch(url)) {
      await launch(url);
      return Result(code: Status.success);
    } else {
      return Result(code: Status.exception, message: 'Failed to open maps');
    }
  }
}
