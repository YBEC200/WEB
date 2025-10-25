import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        leadingWidth: 50,
        title: Hero(
                  tag: "logo",
                  child: Image.asset("assets/img/image.png", width: 100,)
                ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: double.maxFinite,),
                Card(
                  color: Colors.green[50],
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Compra realizada'),
                    subtitle: Text('Procesador Ryzen 5 comprado exitosamente.'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('10/07/2025', style: TextStyle(fontSize: 12)),
                        IconButton(
                          icon: Icon(Icons.qr_code, color: Colors.blue),
                          tooltip: 'Verificar compra',
                          onPressed: () {
                            Navigator.pushNamed(context, "qr", arguments: {
                              'producto': 'Procesador Ryzen 5',
                              'fecha': '10/07/2025',
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          //const Text("Al ingresar aceptas los ''Terminos y Condiciones''", style: TextStyle(fontSize: 14,)),
          SizedBox(height: 20)
          ],
          
        ),
      ),
      

    );
  }
}