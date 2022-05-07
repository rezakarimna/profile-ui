import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
      ),
    );
  }
}

enum _SkillType { photoshop, xd, illustrator, afterEffects, lightRoom }

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secoandaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secoandaryTextColor = Colors.white70,
        surfaceColor = Color(0X0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secoandaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0X0d00000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        brightness: brightness,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor , foregroundColor: primaryTextColor , elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor))),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color.fromARGB(100, 100, 100, 100),
        ),
        fontFamily: 'primary',
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 13, color: secoandaryTextColor),
            bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
            headline6:
                TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
            subtitle1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryTextColor)));
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  MyHomePage({Key? key, required this.toggleThemeMode}) : super(key: key);
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
        appBar: AppBar(title: const Text("Curriculum vitae"), actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          )
        ]),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
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
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('Product & print'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.location,
                                size: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                              const SizedBox(
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
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                    )
                  ],
                ),
              ),
              const SizedBox(
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
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "personal Information",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                        decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(CupertinoIcons.at),
                    )),
                    SizedBox(height: 8,),
                    const TextField(
                        decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock),
                    )),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Save')))
                  ],
                ),
              )
            ],
          ),
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
                color: const Color.fromARGB(25, 100, 100, 100),
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 25)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
