import 'package:animator_galaxy_planet/controlles/providers/loadjson_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Heart_page extends StatefulWidget {
  const Heart_page({super.key});

  @override
  State<Heart_page> createState() => _Heart_pageState();
}

class _Heart_pageState extends State<Heart_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CupertinoColors.white,
        title: const Text("Favourite"),
        backgroundColor: CupertinoColors.black,
        actions: const [
          Icon(
            CupertinoIcons.heart_fill,
            color: CupertinoColors.destructiveRed,
            size: 30,
          ),
        ],
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/star.png"),
          ),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount:
                Provider.of<Favrioute_Provider>(context).favrioute.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<Favrioute_Provider>(context)
                                    .favrioute[i]
                                    .name,
                                style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 40,
                                ),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 60,
                                foregroundImage: AssetImage(
                                    Provider.of<Favrioute_Provider>(context)
                                        .favrioute[i]
                                        .image),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Color : ",
                                style: TextStyle(
                                    color: CupertinoColors.white, fontSize: 20),
                              ),
                              Text(
                                Provider.of<Favrioute_Provider>(context)
                                    .favrioute[i]
                                    .color,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            Provider.of<Favrioute_Provider>(context)
                                .favrioute[i]
                                .details,
                            style: TextStyle(
                                color: CupertinoColors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
