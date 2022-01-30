// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'dart:typed_data';

void openImage(Uint8List value, String filename) async {
  final urlBlob = _createObjectBlobUrlFromUint8List(value, filename);

  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = urlBlob
    ..style.display = 'none'
    ..target = "_blank";

  _executeActionOnAnchor(anchor, urlBlob);
}

void saveImage(Uint8List value, String filename) async {
  final urlBlob = _createObjectBlobUrlFromUint8List(value, filename);

  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = urlBlob
    ..style.display = 'none'
    ..download = "$filename.png";

  _executeActionOnAnchor(anchor, urlBlob);
}

String _createObjectBlobUrlFromUint8List(Uint8List value, String filename) {
  final blob = html.Blob([value], 'image/png');
  return html.Url.createObjectUrlFromBlob(blob);
}

void _executeActionOnAnchor(html.AnchorElement anchor, String urlBlob) {
  html.document.body?.children.add(anchor);
  anchor.click();
  html.document.body?.children.remove(anchor);
  Future.delayed(const Duration(minutes: 1), () {
    html.Url.revokeObjectUrl(urlBlob);
  });
}
