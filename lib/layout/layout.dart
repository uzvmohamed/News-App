import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/modules/search.dart';
import 'package:news/shared/components/components.dart';
import '../cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text("News"),
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                      maxHeight: 30, maxWidth: 30, minWidth: 30, minHeight: 30),
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    navigateTo(
                        context, SearchScreen()..searchNode.requestFocus());
                  },
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: BottomNavigationBar(
                  onTap: ((value) {
                    cubit.changeBNB(value);
                  }),
                  currentIndex: cubit.currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Icon(
                          Icons.account_balance_rounded,
                          size: 30,
                        ),
                      ),
                      label: "Politics",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bar_chart_rounded,
                        size: 30,
                      ),
                      label: "Business",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.sports,
                        size: 30,
                      ),
                      label: "Sports",
                    ),
                  ]),
            ),
          );
        });
  }
}
