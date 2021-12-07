import 'package:flutter/services.dart';

class NativeTool {
  static const methodChannel = const MethodChannel("tech.1126.flutter/native_get");
  static const eventChannel = const EventChannel("tech.1126.flutter/native_post");

  static dynamic postMessage(String methodName,[dynamic args]) async {
    dynamic result = await methodChannel.invokeMethod(methodName,args);
    return result;
  }

  static receiveMessage(String message,void onData(dynamic event), {Function? onError,  void onDone()?,  bool? cancelOnError}){
    eventChannel.receiveBroadcastStream(message).listen(onData,onError: onError);
  }
}