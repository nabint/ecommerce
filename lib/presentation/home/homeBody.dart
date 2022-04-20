import 'dart:developer';

import 'package:ecommerce/presentation/home/widgets/tabbarmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login_cubit.dart';
import '../../utils/routers.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    String _searchText = "";
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignedOut) {
          Navigator.pushReplacementNamed(context, Routers.LOGIN_PAGE);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<LoginCubit>().logout();
                },
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                          ),
                          child: IconButton(
                            onPressed: () {
                              log("message");
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(Icons.menu, size: 30),
                          ),
                        ),
                        SizedBox(
                            width: 267.0,
                            child: TextField(
                              onTap: () {},
                              onSubmitted: (value) {},
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: "Search",
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                suffixIcon: _searchText.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {},
                                      )
                                    : null,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: Text(
                      'Order online collect in store',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 34.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: SelectionScreen(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
