import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_flutter/features/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Center(child: Text("Home Page")),
      Center(child: Text("Search Page")),
      Center(child: Text("Profile Page")),
    ];

    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Home'),
            actions: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Logout',
                    child: Text('Logout'),
                  ),
                ],
                onSelected: (String result) {
                  switch (result) {
                    case 'Logout':
                      break;
                  }
                },
              ),
            ],
          ),
          body: pages[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (int i) => context.read<BottomNavCubit>().changePage(i),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
