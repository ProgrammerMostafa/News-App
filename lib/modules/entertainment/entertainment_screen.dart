import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/components/components.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/state.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var listEntertainment = NewsCubit.get(ctx).entertainment;
        return articleBuilder(listEntertainment);
      },
    );
  }
}
