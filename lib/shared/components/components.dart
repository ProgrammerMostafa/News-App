import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_using_bloc/modules/webView/web_view_screen.dart';

Widget defaultButton() {
  return OutlinedButton(
    onPressed: () {},
    child: const Text('sss'),
  );
}

Widget defaultTextField({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIconData,
  required TextInputType keyboardType,
  Function()? onTapeFun,
  Function(String)? onChangeFun,
  String? Function(String?)? validateFun,
  bool readOnly = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIconData),
      border: const OutlineInputBorder(),
      focusColor: Colors.amber,
      hoverColor: Colors.blue,
    ),
    keyboardType: keyboardType,
    onTap: onTapeFun,
    onChanged: onChangeFun,
    readOnly: readOnly,
    validator: validateFun,
  );
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Container(
      width: double.infinity,
      height: 2.0,
      color: Colors.grey[500],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////
void navigateTo(BuildContext ctx, Widget nextScreen) {
  Navigator.push(ctx, MaterialPageRoute(builder: (_) => nextScreen));
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
Widget articleBuilder(list, {isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (_) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (ctx, index) => buildArticleItem(list[index], ctx),
      separatorBuilder: (_, index) => myDivider(),
    ),
    fallback: (_) => isSearch
        ? Container()
        : const Center(child: CircularProgressIndicator()),
  );
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
Widget buildArticleItem(articleItem, ctx) {
  String date = articleItem['publishedAt'].split('T')[0];
  String time =
      articleItem['publishedAt'].split('T')[1].toString().substring(0, 5);
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: InkWell(
      onTap: () => navigateTo(
          ctx,
          WebViewScreen(
            articleItem: articleItem,
          )),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ConditionalBuilder(
                condition: articleItem['urlToImage'] != null,
                builder: (_) => FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/waiting.png',
                  image: articleItem['urlToImage'],
                ),
                fallback: (_) => Image.asset(
                  'assets/images/NoImageAvailable.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //////////////////////////
          const SizedBox(width: 10),
          //////////////////////////
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articleItem['title']}',
                      style: Theme.of(ctx).textTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  /////////////
                  Text(
                    '$time   $date',
                    style: Theme.of(ctx).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

ThemeData buildthemeData({
  required bool isDarkTheme,
  required Color mainColor,
  required Color secondColor,
}) {
  return ThemeData(
    primarySwatch: Colors.deepOrange,
    canvasColor: mainColor,
    scaffoldBackgroundColor: secondColor,
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: mainColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
      titleTextStyle: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainColor,
      elevation: 30.0,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: isDarkTheme ? Colors.grey[300] : Colors.black54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        color: isDarkTheme ? Colors.grey[500] : Colors.grey[700],
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
  );
}
