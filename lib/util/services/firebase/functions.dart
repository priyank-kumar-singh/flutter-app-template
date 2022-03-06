import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import '../../../models/models.dart';

class FirebaseFunctionService {
  static final _functions = FirebaseFunctions.instance;

  Future<Result> upvotePost(String postId) async {
    try {
      await _functions
        .httpsCallable(
          'upvote',
          options: HttpsCallableOptions(
            timeout: const Duration(seconds: 20),
          ),
        ).call({
          'id': postId,
        });
      return Result(code: Status.success);
    } on FirebaseException catch (e) {
      return Result(code: Status.firebase, message: e.message);
    } on PlatformException catch (e) {
      return Result(code: Status.platform, message: e.message);
    } on SocketException catch (e) {
      return Result(code: Status.socket, message: e.message);
    } on TimeoutException catch (e) {
      return Result(code: Status.timeout, message: e.message);
    } catch (e) {
      return Result(code: Status.exception, message: e.toString());
    }
  }
}
