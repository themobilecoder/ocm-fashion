// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'dart:typed_data';

save(Uint8List value, String filename) async {
  final blob = html.Blob([value]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = "$filename.png";
  html.document.body?.children.add(anchor);
  anchor.click();
  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
