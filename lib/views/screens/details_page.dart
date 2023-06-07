import 'dart:math';

import 'package:animator_galaxy_planet/controlles/providers/loadjson_provider.dart';
import 'package:animator_galaxy_planet/models/palnet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details_page extends StatefulWidget {
  const Details_page({super.key});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
      lowerBound: 0,
      upperBound: 2 * pi,
    );

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Planets_Model data =
        ModalRoute.of(context)!.settings.arguments as Planets_Model;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        actions: [
          PopupMenuButton(
            initialValue: Provider.of<PopupmenuProvider>(context)
                .popupmenuModel
                .initialpopupvalue,
            onSelected: (val) {
              Provider.of<PopupmenuProvider>(context)
                  .popupmenuModel
                  .initialpopupvalue = val;
            },
            itemBuilder: (context) {
              return [

                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          data.favrioute = !data.favrioute;
                          Navigator.of(context).pushReplacementNamed(
                            'Heart_page',
                          );
                          Provider.of<Favrioute_Provider>(context,
                                  listen: false)
                              .addfavrioute(
                            added: data,

                          );

                        },
                        icon: (data.favrioute == true)
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red,
                              )
                            : const Icon(CupertinoIcons.heart),
                      ),
                      const Text(" favrioute"),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/star.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  // color: Colors.blueGrey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                // child: CircleAvatar(
                //   radius: 100,
                //   foregroundImage: AssetImage(
                //     data.image,
                //   ),
                // ),
                child: AnimatedBuilder(
                  animation: animationController,
                  child: CircleAvatar(
                    radius: 100,
                    foregroundImage: AssetImage(
                      data.image,
                    ),
                  ),
                  builder: (context, widget) {
                    return Transform.rotate(
                      angle: animationController.value,
                      child: widget,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        animationController.forward();
                      },
                      icon: const Icon(
                        CupertinoIcons.play_circle,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        animationController.reverse();
                      },
                      icon: const Icon(
                        CupertinoIcons.refresh_bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        animationController.repeat();
                      },
                      icon: const Icon(
                        CupertinoIcons.repeat,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        animationController.stop();
                      },
                      icon: const Icon(
                        CupertinoIcons.stop_fill,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: CupertinoColors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "Information",
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text(
                      "Color : ",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      data.color,
                      style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.details,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
