import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../widget/ButtonWidget.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('Qr Code Scanner'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              '$qrCode',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 50,),
            ButtonWidget(
              color: Colors.black26,
              text: 'Scan Qr Code',
              onClicked: () => scanQrCode(),
            )
          ],
        ),
      ),
    );
  }
  
  Future<void>scanQrCode() async {
    try{
      String qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#5fa693', 
        'Cancel', 
        true, 
        ScanMode.QR
        );
        if(!mounted) return;
        setState(() {
          this.qrCode = qrCode.isEmpty ? '' : qrCode == '-1' ? '' : qrCode ;
        });
    } on PlatformException{
      qrCode = 'Failed to get platform version'; 
    }
  }
}