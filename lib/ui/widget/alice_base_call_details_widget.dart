import 'dart:convert';

import 'package:chuck_interceptor/helper/alice_conversion_helper.dart';
import 'package:chuck_interceptor/utils/alice_parser.dart';
import 'package:flutter/material.dart';

abstract class AliceBaseCallDetailsWidgetState<T extends StatefulWidget>
    extends State<T> {
  final JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  Widget getListRow(String name, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Flexible(
          child: SelectableText(
            value,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 18),
        )
      ],
    );
  }

  String formatBytes(int bytes) => AliceConversionHelper.formatBytes(bytes);

  String formatDuration(int duration) =>
      AliceConversionHelper.formatTime(duration);

  String formatBody(dynamic body, String? contentType) =>
      AliceParser.formatBody(body, contentType);

  String? getContentType(Map<String, dynamic>? headers) =>
      AliceParser.getContentType(headers);
}
