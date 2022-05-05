import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Colors.pink.shade400,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          fontFamily: 'primary',
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
              bodyText2: TextStyle(fontSize: 15),
              headline6: TextStyle(fontWeight: FontWeight.bold),
              subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      home: MyHomePage(),
    );
  }
}

enum _SkillType { photoshop, xd, illustrator, afterEffects, lightRoom }

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;

  void updateSelectSkill(_SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = 'Photoshop';
    return Scaffold(
        appBar: AppBar(title: const Text("Curriculum vitae"), actions: const [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        width: 80,
                        height: 80,
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brice seraphin',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text('Product & print'),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 14,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Paris , France',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                'Short monologues are great for acting tests You, like most actors and actresses, have probably searched words like "monologue for acting test',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                children: [
                  Text(
                    "Skils",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    type: _SkillType.photoshop,
                    title: 'Photoshop',
                    imagePath: 'assets/images/photoshop.png',
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.photoshop,
                    onTop: () {
                      updateSelectSkill(_SkillType.photoshop);
                    },
                  ),
                  Skill(
                      type: _SkillType.xd,
                      title: 'Adobe XD',
                      imagePath: 'assets/images/adobe_xd.png',
                      shadowColor: Colors.pink,
                      isActive: _skill == _SkillType.xd,
                      onTop: () {
                        updateSelectSkill(_SkillType.xd);
                      }),
                  Skill(
                    type: _SkillType.illustrator,
                    title: 'Illustrator',
                    imagePath: 'assets/images/illustrator.png',
                    shadowColor: Colors.orange,
                    isActive: _skill == _SkillType.illustrator,
                    onTop: () {
                      updateSelectSkill(_SkillType.illustrator);
                    },
                  ),
                  Skill(
                      type: _SkillType.afterEffects,
                      title: 'After Effects',
                      imagePath: 'assets/images/after_effects.png',
                      shadowColor: Colors.blue.shade800,
                      isActive: _skill == _SkillType.afterEffects,
                      onTop: () {
                        updateSelectSkill(_SkillType.afterEffects);
                      }),
                  Skill(
                      type: _SkillType.lightRoom,
                      title: 'Lightroom',
                      imagePath: 'assets/images/lightroom.png',
                      shadowColor: Colors.blue,
                      isActive: _skill == _SkillType.lightRoom,
                      onTop: () {
                        updateSelectSkill(_SkillType.lightRoom);
                      }),
                ],
              ),
            )
          ],
        ));
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTop;

  const Skill(
      {Key? key,
      required this.type,
      required this.title,
      required this.imagePath,
      required this.shadowColor,
      required this.isActive,
      required this.onTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTop,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Color.fromARGB(25, 255, 255, 255),
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
