import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_flutter/features/home/home.dart';
import 'package:zoom_flutter/features/home/presentation/home_screen_meeting_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final List<Widget> pages = [
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeScreenMeetingButtons(
              title: 'Join Meeting',
              iconData: Icons.video_call,
              onTap: () {},
            ),
            const HomeScreenMeetingButtons(
              title: 'Schedule Meeting',
              iconData: Icons.calendar_today,
            ),
            const HomeScreenMeetingButtons(
              title: 'Share Screen',
              iconData: Icons.screen_share,
            ),
          ],
        ),
      ]),
      Center(child: Text("Search Page")),
      Center(child: Text("Profile Page")),
    ];

    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) => Scaffold(
          backgroundColor: theme.surface,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Home'),
          ),
          body: pages[state],
          bottomNavigationBar: buildBottomNavigationBar(state, theme, context),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(
      int state, ColorScheme theme, BuildContext context) {
    return BottomNavigationBar(
      currentIndex: state,
      backgroundColor: theme.secondary,
      onTap: (int i) => context.read<BottomNavCubit>().changePage(i),
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
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
    );
  }
}
