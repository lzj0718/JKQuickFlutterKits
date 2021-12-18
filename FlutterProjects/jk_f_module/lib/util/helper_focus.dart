import 'package:flutter/material.dart';

typedef _CallBack = void Function(FocusNode focusNode);

/* MARK: 焦点处理
 * @param {
 *  callback 回调
 * }
 * @return:
 * @Deprecated: 否
 */
FocusNode shFocusNode(_CallBack callback) {
  FocusNode focusNode = FocusNode();
  focusNode.addListener(() {
    callback(focusNode);
  });

  return focusNode;
}
