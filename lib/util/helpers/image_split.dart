// import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
import 'package:image/image.dart' as imglib;

abstract class ImageHelper {
  // static Future<List<Uint8List>> splitWithHTTPParse(String input, int gridSize) async {
  //   final List<int> byteImage = await http.readBytes(Uri.parse(input));
  //   return _split(byteImage, gridSize);
  // }

  static Future<List<Uint8List>> splitWithRootBundle(String input, int gridSize) async {
    final data = await rootBundle.load(input).then((value) => value.buffer.asUint8List());
    return _split(data, gridSize);
  }

  // static List<Uint8List> splitWithDartIO(String input, int gridSize) {
  //   return _split(File(input).readAsBytesSync(), gridSize);
  // }

  static List<Uint8List> _split(List<int> byteImage, int gridSize) {
    final image = imglib.decodePng(byteImage)!;
    final width = (image.width / gridSize).round();
    final height = (image.height / gridSize).round();

    // split image into parts
    List<imglib.Image> parts = [];
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        parts.add(imglib.copyCrop(image, j * width, i * height, width, height));
      }
    }

    // convert image from image package to Uint8List
    List<Uint8List> output = [];
    for (var img in parts) {
      output.add(Uint8List.fromList(imglib.encodePng(img)));
    }
    return output;
  }

  static Image fromUint8List(
    Uint8List image, {
    double? scale,
    BoxFit? fit,
    double? height,
    double? width,
    String? semanticLabel,
  }) {
    return Image.memory(
      image,
      scale: scale ?? 1.0,
      fit: fit,
      height: height,
      width: width,
      semanticLabel: semanticLabel,
    );
  }
}
