import 'dart:math';

import 'package:animator_galaxy_planet/controlles/providers/loadjson_provider.dart';
import 'package:animator_galaxy_planet/controlles/providers/theme_provider.dart';
import 'package:animator_galaxy_planet/models/palnet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    loadJson();

    super.initState();
  }

  loadJson() async {
    Provider.of<LoadJsonProvider>(context, listen: false).loadJson();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar
        //   (elevation: 0,
        //   backgroundColor:Colors.black,
        //   title: const Text("Galaxy planet",style: TextStyle(color: Colors.white),),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         Provider.of<ThemeAccessProvider>(context, listen: false)
        //             .Changetheme();
        //       },
        //       icon: (Provider.of<ThemeAccessProvider>(context)
        //                   .themeAccessModel
        //                   .isdark ==
        //               false)
        //           ? const Icon(
        //               CupertinoIcons.moon_stars_fill,
        //             )
        //           : const Icon(
        //               CupertinoIcons.sun_max_fill,
        //             ),
        //     ),
        //   ],
        // ),
        body: (Provider.of<LoadJsonProvider>(context).planets.isNotEmpty)
            // ? CustomScrollView(
            //     slivers: [
            //       SliverAppBar(
            //         flexibleSpace: FlexibleSpaceBar(
            //           title: Text(textAlign: TextAlign.left,
            //             "Galaxy Planet",
            //           ),
            //           collapseMode: CollapseMode.pin,
            //           background: Image.asset("assets/images/bg.png"),
            //         ),
            //         collapsedHeight: 80,
            //         expandedHeight:220,
            //         pinned: true,
            //         // floating: true,
            //         // snap: true,
            //       ),
            //     ],
            //   )
            ? Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/star.png"),
                  ),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Expanded(
                        child: Row(
                          children: [
                            const Text(
                              "Galaxy Planet",
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Provider.of<ThemeAccessProvider>(context,
                                        listen: false)
                                    .Changetheme();
                              },
                              icon: (Provider.of<ThemeAccessProvider>(context)
                                          .themeAccessModel
                                          .isdark ==
                                      false)
                                  ? const Icon(
                                      CupertinoIcons.moon_stars_fill,
                                      color: CupertinoColors.white,
                                    )
                                  : const Icon(
                                      CupertinoIcons.sun_max_fill,
                                      color: Colors.white,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<LoadJsonProvider>(context)
                            .planets
                            .length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('Details_page',
                                  arguments: Provider.of<LoadJsonProvider>(
                                          context,
                                          listen: false)
                                      .planets[i]);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  //zoom
                                  // TweenAnimationBuilder(
                                  //   tween: Tween<double>(begin: 0.5, end: 1),
                                  //   duration: Duration(seconds: 3),
                                  //   builder: (context, val, widget) {
                                  //     return Transform.scale(
                                  //       scale: val,
                                  //       child: CircleAvatar(
                                  //         radius: 60,
                                  //         foregroundImage: AssetImage(
                                  //             Provider.of<LoadJsonProvider>(
                                  //                     context)
                                  //                 .planets[i]
                                  //                 .image),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                  //rotate
                                  // TweenAnimationBuilder(
                                  //     tween:
                                  //         Tween<double>(begin: 0, end: 3* pi),
                                  //     duration: Duration(seconds: 5),
                                  //     curve: Curves.easeInOut,
                                  //     child: CircleAvatar(
                                  //               radius: 60,
                                  //               foregroundImage: AssetImage(
                                  //                   Provider.of<LoadJsonProvider>(
                                  //                           context)
                                  //                       .planets[i]
                                  //                       .image),
                                  //             ),
                                  //     builder: (context, val, widget) {
                                  //       return Transform.rotate(
                                  //         angle: val,
                                  //         child: widget,
                                  //       );
                                  //     },),
                                  //rotate and zoom
                                  TweenAnimationBuilder(
                                    tween: Tween<double>(
                                      begin: 0,
                                      end: 2 * pi,
                                    ),
                                    duration: Duration(seconds: 4),
                                    builder: (context, val, widget) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: TweenAnimationBuilder(
                                          tween: Tween<double>(
                                            begin: 0.5,
                                            end: 1.1,
                                          ),
                                          curve: Curves.easeInOut,
                                          child: CircleAvatar(
                                            radius: 60,
                                            foregroundImage: AssetImage(
                                                Provider.of<LoadJsonProvider>(
                                                        context)
                                                    .planets[i]
                                                    .image),
                                          ),
                                          duration: Duration(seconds: 4),
                                          builder: (context, val, widget) {
                                            return Transform.scale(
                                              scale: val,
                                              child: widget,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  // CircleAvatar(
                                  //   radius: 60,
                                  //   foregroundImage: AssetImage(
                                  //       Provider.of<LoadJsonProvider>(context)
                                  //           .planets[i]
                                  //           .image),
                                  // ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  Expanded(
                                    child: Text(
                                      Provider.of<LoadJsonProvider>(context)
                                          .planets[i]
                                          .name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: CupertinoColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12,
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container());
  }
}
