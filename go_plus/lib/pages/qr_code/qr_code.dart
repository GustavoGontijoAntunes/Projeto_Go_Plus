import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  static String routeName = "/qr_code";
  final String qrCode;

  const QrCodePage({
    Key key,
    this.qrCode,
  }): super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: widget.qrCode,
                  version: QrVersions.auto,
                  size: 300.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
