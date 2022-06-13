import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/search/search_screen.dart';
import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext ctx, NewsStates state) {},
      builder: (BuildContext ctx, NewsStates currentState) {
        NewsCubit cubit = NewsCubit.get(ctx);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            ////////////////////////////////////////////////////////////////////
            appBar: AppBar(
              title: Text(cubit.currentNews),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(ctx, SearchScreen());
                  },
                  icon: const Icon(Icons.search),
                ),
                ///////////
                IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            ////////////////////////////////////////////////////////////////////
            body: cubit.screens[cubit.currentIndex],
            ////////////////////////////////////////////////////////////////////
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: cubit.currentIndex,
              onTap: (newIndex) {
                cubit.changeBottomNavBarIndex(newIndex);
              },
              items: cubit.bottomNavItems,
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            ),
            ////////////////////////////////////////////////////////////////////
          ),
        );
      },
    );
  }
}
