import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flooding Design System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: FloodingColor.main600),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flooding Design system'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloodingDropdownButton(
                  onTap: (it) {},
                  showList: ['1기', '2기'],
                  defaultValue: '기수',
                  width: 101,
                ),
                FloodingDefaultButton(
                  text: '신청',
                  onTap: () {},
                ),
                FloodingTextField(
                  textFieldState: FloodingTextFieldState.email,
                  controller: TextEditingController(),
                  hintText: '이메일을 입력해주세요',
                ),
                FloodingTextField(
                  textFieldState: FloodingTextFieldState.password,
                  controller: TextEditingController(),
                  hintText: '비밀번호를 입력해주세요',
                ),
                FloodingTextField(
                  textFieldState: FloodingTextFieldState.search,
                  controller: TextEditingController(),
                  onEditingComplete: () {},
                  hintText: '검색할 학생을 입력해주세요',
                ),
                FloodingTextField(
                  textFieldState: FloodingTextFieldState.basic,
                  controller: TextEditingController(),
                  hintText: '아무거나',
                ),
                Wrap(
                  children: [
                    FloodingIcon.home(),
                    FloodingIcon.homeOutline(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.genres(),
                    FloodingIcon.genresOutline(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.filter(),
                    FloodingIcon.filterOutline(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.recommend(),
                    FloodingIcon.recommendOutline(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.checkBox(),
                    FloodingIcon.checkBoxOutline(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.arrowDown(),
                    FloodingIcon.arrowUp(),
                    FloodingIcon.arrowLeft(),
                    FloodingIcon.arrowRight(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.arrowBack(),
                    FloodingIcon.arrowForward(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.closeSmall(),
                    FloodingIcon.closeBig(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.add(),
                    FloodingIcon.check(),
                    FloodingIcon.error(),
                    FloodingIcon.help(),
                    FloodingIcon.study(),
                    FloodingIcon.search(),
                    FloodingIcon.time(),
                    FloodingIcon.send(),
                    FloodingIcon.trash(),
                    FloodingIcon.all(),
                    FloodingIcon.chair(),
                    FloodingIcon.write(),
                    FloodingIcon.more(),
                    FloodingIcon.logout(),
                    FloodingIcon.featureSearch(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.homebase(),
                    FloodingIcon.homebaseFill(),
                    FloodingIcon.club(),
                    FloodingIcon.clubFill(),
                    FloodingIcon.manager(),
                    FloodingIcon.managerFill(),
                    FloodingIcon.dormitory(),
                    FloodingIcon.dormitoryFill(),
                    FloodingIcon.attendance(),
                    FloodingIcon.attendanceFill(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.eyeClose(),
                    FloodingIcon.eyeOpen(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.bellDisableOutline(),
                    FloodingIcon.bellEnableOutline(),
                    FloodingIcon.bellDisable(),
                    FloodingIcon.bellEnable(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    FloodingIcon.image(),
                    FloodingIcon.imageHide(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FloodingIcon.location(),
                SizedBox(
                  height: 20,
                ),
                FloodingIcon.logo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
