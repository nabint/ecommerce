import 'package:ecommerce/presentation/home/carditem.dart';
import 'package:ecommerce/presentation/home/iniciopage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InicioPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 41, 41, 46),
        iconSize: 30,
        elevation: 0.9,
        backgroundColor: const Color(0xfff2f2f2),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Color(0xff200E32)),
              label: '',
              activeIcon: Icon(
                Icons.home,
                color: Color(0xff5956E9),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Color(0xff200E32),
              ),
              backgroundColor: Color(0xfff2f2f2),
              label: '',
              activeIcon: Icon(
                Icons.favorite,
                color: Color(0xff5956E9),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Color(0xff200E32)),
              backgroundColor: Color(0xfff2f2f2),
              label: '',
              activeIcon: Icon(
                Icons.person,
                color: Color(0xff5956E9),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: Color(0xff200E32)),
            backgroundColor: Color(0xfff2f2f2),
            label: '',
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Color(0xff5956E9),
            ),
          ),
        ],
      ),
    );
  }
}
