import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math' as math;

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  final controller = TextEditingController();
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Qr Code Generator',
          ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: (math.min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height)) / 1.3,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40,),
              buildTextField(context),
            ],
          ),
        ),
      ),
    );
  }
  
  buildTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        decoration: InputDecoration(
          hintText: 'Type here...',
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0XFF5fa693),
          )),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 236, 236, 236),
          )),
          suffixIcon: IconButton(
            color: ispressed ?Color(0XFF5fa693) : Color.fromARGB(255, 243, 243, 243),
            icon: const Icon(Icons.done, size: 30,),
            onPressed: (){
              setState(() {
                ispressed = true;
              });
            }
          )
        ),
      ),
    );
  }
}