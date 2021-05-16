import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/PackagesPage.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/studentProfile.dart';

import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  int currentPlace;
  CollapsingNavigationDrawer(this.currentPlace);
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    currentSelectedIndex = widget.currentPlace;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
    isCollapsed = !isCollapsed;
    isCollapsed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 0.0,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        color: drawerBackgroundColor,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       isCollapsed = !isCollapsed;
            //       isCollapsed
            //           ? _animationController.forward()
            //           : _animationController.reverse();
            //     });
            //   },
            //   child: AnimatedIcon(
            //     icon: AnimatedIcons.close_menu,
            //     progress: _animationController,
            //     color: selectedColor,
            //     size: 22.0,
            //   ),
            // ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, counter) {
                  return Divider(height: 20.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = 0;
                        if (counter == 0) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentProfile()));
                        }
                        if (counter == 1) {
                          currentSelectedIndex = 1;

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        }
                        if (counter == 2) {
                          currentSelectedIndex = 2;

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        }
                        if (counter == 3) {
                          currentSelectedIndex = 3;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LearingMaterialPage()));
                        }
                        if (counter == 4) {
                          currentSelectedIndex = 4;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PackagesPage()));
                        }
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
