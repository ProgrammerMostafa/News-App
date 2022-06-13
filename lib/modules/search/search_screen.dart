import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/components/components.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var cubit = NewsCubit.get(ctx);
        var listSearch = cubit.search;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: PreferredSize(
              child: Container(
                color: Theme.of(ctx).canvasColor,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 25.0,
                    bottom: 0.0,
                  ),
                  child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'بحث ....',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                        icon: InkWell(
                          splashColor: null,
                          onTap: () {
                            Navigator.pop(ctx);
                            cubit.getSearchNews(searchValue: ' ');
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: cubit.isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {
                        cubit.getSearchNews(searchValue: value);
                      }
                      /////////////////////
                      ),
                ),
              ),
              preferredSize: const Size.fromHeight(60),
            ),
            body: ConditionalBuilder(
              condition: state is! NewsGetSearchSuccessNoDataState,
              builder: (_) => Column(
                children: [
                  Expanded(
                    child: articleBuilder(listSearch, isSearch: true),
                  ),
                ],
              ),
              fallback: (_) => Center(
                child: Image.asset(
                    'assets/images/${cubit.isDark ? 'noData2' : 'noData1'}.png'),
              ),
            ),
          ),
        );
      },
    );
  }
}
