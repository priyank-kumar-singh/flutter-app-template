import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class URLHelper {
  URLHelper._();

  static Future<void> open(String url, [VoidCallback? onError]) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      onError!();
    }
  }

  static Future<void> callto(String phone, {VoidCallback? onError}) async {
    await open('tel://$phone', onError);
  }

  static Future<void> mailTo({
    required String email,
    required String subject,
    required String body,
    VoidCallback? onError,
  }) async {
    await open('mailto:$email?subject=$subject&body=$body', onError);
  }

  static Future<void> launchMaps(GeoPoint source, GeoPoint destination, {VoidCallback? onError}) async {
    var url = "http://maps.google.com/maps?saddr=" +
        source.latitude.toString() + "," +
        source.longitude.toString() + "&daddr=" +
        destination.latitude.toString() + "," +
        destination.longitude.toString();
    await open(url, onError);
  }
}
