import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


import '../../../config/size_config.dart';
import '../../../provider/base_view.dart';
import '../../../view/home_screen_view_model.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../details_screen/components/weight_operations.dart';
import '../details_screen/details_screen.dart';
import '../user_profile/user_profile.dart';
import 'components/body.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';
  final ThemeMode? themeMode;
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final FlexSchemeData? flexSchemeData;
  const HomeScreen(
      {Key? key, this.onThemeModeChanged, this.themeMode, this.flexSchemeData})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(child: Text('Lossy')),
            ),
            body: PageView(controller: model.pageController, children: [
              SingleChildScrollView(
                child: Body(
                  model: model,
                ),
              ),
              DetailsScreen(),
              UserProfile(
                onThemeModeChanged: widget.onThemeModeChanged,
                flexSchemeData: widget.flexSchemeData,
                themeMode: widget.themeMode,
              ),
            ]),
            floatingActionButton: ElevatedButton(
              onPressed: () {
                WeightOperations.addWeight(context, model);

              },
              child: Text(
                'Add Weight here',
                style: TextStyle(
                  fontSize: 15,
                  color: ThemeData().scaffoldBackgroundColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.all(10),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(model),
          );
        });
  }
}
