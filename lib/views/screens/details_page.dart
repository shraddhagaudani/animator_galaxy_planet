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
        seconds: 5,
      ),
    );

    sizeAnimation = Tween<double>(begin: 100, end: 300).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Planets data = ModalRoute.of(context)!.settings.arguments as Planets;
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
                          Navigator.pop(context);
                          animationController.forward();
                        },
                        icon: const Icon(
                          CupertinoIcons.play_circle,
                        ),
                      ),
                      const Text(
                        "Animate",
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          animationController.reverse();
                        },
                        icon: const Icon(CupertinoIcons.refresh_bold),
                      ),
                      const Text(
                        "Reverse",
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          animationController.stop();
                        },
                        icon: const Icon(
                          CupertinoIcons.stop_fill,
                        ),
                      ),
                      const Text(
                        "Stop",
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          animationController.reverse();
                        },
                        icon: const Icon(CupertinoIcons.repeat),
                      ),
                      const Text("Repeat")
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
                  borderRadius: BorderRadius.circular(20),
                ),
                // child: CircleAvatar(
                //   radius: 100,
                //   foregroundImage: AssetImage(
                //     data.image,
                //   ),
                // ),
                child: RotationTransition(
                  turns: animationController,
                  child: GestureDetector(
                    onTap: () {
                      animationController.forward();
                    },
                    onDoubleTap: () {
                      animationController.reverse();
                    },
                    onDoubleTapCancel: () {
                      animationController.stop();
                    },
                    // onDoubleTapDown: (){},
                    child: CircleAvatar(
                      radius: 100,
                      foregroundImage: AssetImage(
                        data.image,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
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
                height: 30,
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
                height: 20,
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
