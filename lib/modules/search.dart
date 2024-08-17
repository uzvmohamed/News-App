import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  final FocusNode searchNode = FocusNode();

  SearchScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var list = cubit.search;
        return PopScope(
          onPopInvokedWithResult: (popInv, result) {
            cubit.search = [];
          },
          child: Scaffold(
            appBar: AppBar(
              title: TextFormField(
                controller: searchController,
                focusNode: searchNode,
                onChanged: (value) {
                  cubit.getSearch(searchController.text);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! BusinessLoadingState,
              builder: (context) {
                return RefreshIndicator(
                  edgeOffset: 90,
                  onRefresh: () async {
                    cubit.getBusiness();
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return article(list[index], context);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: list.length,
                  ),
                );
              },
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
