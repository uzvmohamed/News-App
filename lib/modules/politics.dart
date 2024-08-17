import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../shared/components/components.dart';

class PoliticsScreen extends StatelessWidget {
  const PoliticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var list = cubit.politics;
        return ConditionalBuilder(
          condition: state is! PoliticsLoadingState,
          builder: (context) {
            return RefreshIndicator(
              edgeOffset: 90,
              onRefresh: () async {
                cubit.getPolitics();
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
        );
      },
    );
  }
}
