import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/components/components.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/state.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var listHealth = NewsCubit.get(ctx).health;
        return articleBuilder(listHealth);
      },
    );
  }
}