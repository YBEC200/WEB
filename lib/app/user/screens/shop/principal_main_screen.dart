import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styles/input_styles.dart';
import 'package:flutter_application_1/core/styles/nav_bar_styles.dart';

class PrincipalMain extends StatefulWidget {

  const PrincipalMain({super.key});

  @override
  State<PrincipalMain> createState() => _PrincipalMainState();
}

class Product {
  final String name;
  final String category;
  final String description;

  Product({required this.name, required this.category, required this.description});
}

class _PrincipalMainState extends State<PrincipalMain> {
  final List<String> categories = [
  'Todos', 'Componentes', 'Recursos', 'Computadores'
  ];

  final List<Product> products = [
    Product(name: 'Procesador Ryzen 5', category: 'Componentes', description: 'Procesador de alto rendimiento.'),
    Product(name: 'Licencia Windows 11', category: 'Recursos', description: 'Licencia original para Windows 11.'),
  ];

  int selectedCategory = 0;
  int _selectedIndex = 1;

  List<Product> get filteredProducts {
    if (selectedCategory == 0) return products;
    return products.where((p) => p.category == categories[selectedCategory]).toList();
  }

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
                
                SizedBox(height: 10),
                SizedBox(
                  width: 550,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppInputStyles.defaultInput(
                      label: "¿Que desea comprar?",
                      isPassword: false,
                      obscureText: false,
                      onToggleObscure: null,
                      suffix: Icon(Icons.search, color: Colors.grey), // <-- Lupa al final
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AppCategoryBar.categoryFilterBar(
                  categories: categories,
                  selected: selectedCategory,
                  onSelected: (index) {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 400, // Ajusta la altura según lo que necesites
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: filteredProducts.map((product) => Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(product.description, style: TextStyle(fontSize: 12)),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 22, 119, 199),
                                foregroundColor: Colors.white,
                                minimumSize: Size(double.infinity, 36),
                                padding: EdgeInsets.symmetric(horizontal: 0),
                              ),
                              child: Text('Agregar al carrito'),
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ],
            ),
          //const Text("Al ingresar aceptas los ''Terminos y Condiciones''", style: TextStyle(fontSize: 14,)),
          SizedBox(height: 20)
          ],
          
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 22, 119, 199),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, "user");
              break;
            case 1:
              Navigator.pushReplacementNamed(context, "principal");
              break;
            case 2:
              Navigator.pushReplacementNamed(context, "shop_cart");
              break;
            default:
          }
          // Aquí puedes navegar a otras páginas si lo deseas
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          )        
        ],
      ),

    );
  }
}