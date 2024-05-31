import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:html' as html;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), drawer: _buildDrawer(context), body: _buildBody(context));
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
    titleSpacing: 0.0,
    title: _buildTitle(),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    actions: !ResponsiveBreakpoints.of(context).isMobile ? _buildActions() : null,
  );
}

Widget _buildTitle() {
  return RichText(
    text: TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: "Portfoli",
          style: TextStyles.logo,
        ),
        TextSpan(
          text: "O",
          style: TextStyles.logo.copyWith(
            color: Color(0xFF50AFC0),
          ),
        ),
      ],
    ),
  );
}

List<Widget> _buildActions() {
  return <Widget>[
    MaterialButton(
      child: Text(
        "Home", //Strings.menu_home,
        style: TextStyles.menu_item.copyWith(),
      ),
      onPressed: () {},
    ),
    MaterialButton(
      child: Text(
        "About", //  Strings.menu_about,
        style: TextStyles.menu_item.copyWith(
          color: Color(0xFF50AFC0),
        ),
      ),
      onPressed: () {},
    ),
    MaterialButton(
      child: Text(
        "Contact", // Strings.menu_contact,
        style: TextStyles.menu_item,
      ),
      onPressed: () {},
    ),
  ];
}

_buildDrawer(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isMobile
      ? Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: _buildActions(),
          ),
        )
      : null;
}

//Screen Methods:-------------------------------------------------------------
Widget _buildBody(BuildContext context) {
  return SingleChildScrollView(
    child: ResponsiveBreakpoints.of(context).isMobile
        ? _buildSmallScreen(context)
        : ResponsiveBreakpoints.of(context).isTablet
            ? _buildMediumScreen(context)
            : ResponsiveBreakpoints.of(context).isDesktop
                ? _buildLargeScreen(context)
                : SizedBox(),
  );
}

_buildSmallScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(flex: 1, child: _buildContent(context)),
        Divider(),
        _buildCopyRightText(context),
        SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 12.0 : 0.0),
        _buildSocialIcons(),
        SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 12.0 : 0.0),
      ],
    ),
  );
}

_buildContent(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 24.0 : MediaQuery.of(context).size.height * 0.1),
      // SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 24.0 : 0.0),
      _buildAboutMe(context),
      SizedBox(height: 4.0),
      _buildHeadline(context),
      SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 12.0 : 24.0),
      _buildSummary(),
      SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 24.0 : 48.0),
      ResponsiveBreakpoints.of(context).isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildEducation(),
                SizedBox(height: 24.0),
                _buildSkills(context),
              ],
            )
          : _buildSkillsAndEducation(context),
      SizedBox(height: ResponsiveBreakpoints.of(context).isMobile ? 24.0 : MediaQuery.of(context).size.height * 0.1),
    ],
  );
}

Widget _buildAboutMe(BuildContext context) {
  return RichText(
    text: TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: "About", // Strings.about,
          style: TextStyles.heading.copyWith(
            fontFamily: Fonts.nexa_light,
            fontSize: ResponsiveBreakpoints.of(context).isMobile ? 36 : 45.0,
          ),
        ),
        TextSpan(
          text: " Me", // Strings.me,
          style: TextStyles.heading.copyWith(
            color: Color(0xFF50AFC0),
            fontSize: ResponsiveBreakpoints.of(context).isMobile ? 36 : 45.0,
          ),
        ),
      ],
    ),
  );
}

Widget _buildHeadline(BuildContext context) {
  final aboutMe = "I\'am Zubair Rehman, Mobile App Developer from Islamabad, Pakistan";
  return Text(
    ResponsiveBreakpoints.of(context).isMobile ? aboutMe : aboutMe.replaceFirst(RegExp(r' f'), '\nf'),
    style: TextStyles.sub_heading,
  );
}

Widget _buildSummary() {
  const String summary =
      'Focused professional having excellent technical and communication skills, and offering 6 years of experience in Computer industry. Proficient at designing and formulating test automation frameworks, writing code in various languages, feature development and implementation. Specialize in thinking outside the box to find unique solutions to difficult engineering problems.';
  return Padding(
    padding: EdgeInsets.only(right: 80.0),
    child: Text(
      summary,
      style: TextStyles.body,
    ),
  );
}

Widget _buildSkillsAndEducation(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: _buildEducation(),
      ),
      SizedBox(width: 40.0),
      Expanded(
        flex: 1,
        child: _buildSkills(context),
      ),
    ],
  );
}

// Skills Methods:------------------------------------------------------------
final skills = ['Dart', 'Flutter', 'Android', 'iOS', 'Java basics', 'Kotlin basics', "Git"];

Widget _buildSkills(BuildContext context) {
  final List<Widget> widgets = skills
      .map((skill) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
            child: _buildSkillChip(context, skill),
          ))
      .toList();

  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildSkillsContainerHeading(),
      Wrap(children: widgets),
//        _buildNavigationArrows(),
    ],
  );
}

Widget _buildSkillsContainerHeading() {
  return Text(
    "Skills I have", // Strings.skills_i_have,
    style: TextStyles.sub_heading,
  );
}

Widget _buildSkillChip(BuildContext context, String label) {
  return Chip(
    label: Text(
      label,
      style: TextStyles.chip.copyWith(
        fontSize: ResponsiveBreakpoints.of(context).isMobile ? 10.0 : 11.0,
      ),
    ),
  );
}

//education section
final educationList = [
  Education(
    'Apr 2018',
    'Present',
    'Embrace-it Pakistan',
    'Sr. Software Engineer',
  ),
  Education(
    'Apr 2016',
    'Apr 2018',
    'TEO International',
    'Sr. Software Engineer',
  ),
  Education(
    'July 2014',
    'March 2016',
    'Citrusbits',
    'Software Engineer',
  ),
];

Widget _buildEducation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildEducationContainerHeading(),
      _buildEducationSummary(),
      SizedBox(height: 8.0),
      _buildEducationTimeline(),
    ],
  );
}

Widget _buildEducationContainerHeading() {
  return Text(
    "Experience", // Strings.experience,
    style: TextStyles.sub_heading,
  );
}

Widget _buildEducationSummary() {
  return Text(
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    style: TextStyles.body,
  );
}

Widget _buildEducationTimeline() {
  final List<Widget> widgets = educationList.map((education) => _buildEducationTile(education)).toList();
  return Column(children: widgets);
}

Widget _buildEducationTile(Education education) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          '${education.post}',
          style: TextStyles.company,
        ),
        Text(
          '${education.organization}',
          style: TextStyles.body.copyWith(
            color: Color(0xFF45405B),
          ),
        ),
        Text(
          '${education.from}-${education.to}',
          style: TextStyles.body,
        ),
      ],
    ),
  );
}

// Footer Methods:------------------------------------------------------------
Widget _buildFooter(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(),
      Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              child: _buildCopyRightText(context),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: _buildSocialIcons(),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildCopyRightText(BuildContext context) {
  return Row(
    children: [
      Text(
        "© 2024", // Strings.rights_reserved,
        style: TextStyles.body1.copyWith(
          fontSize: ResponsiveBreakpoints.of(context).isMobile ? 8 : 10.0,
        ),
      ),
    ],
  );
}

Widget _buildSocialIcons() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          html.window
              .open("https://www.linkedin.com/in/sanjay-c-935b33106", "LinkedIn");
        },
        child: Image.network(
          Assets.linkedin,
          color: Color(0xFF45405B),
          height: 20.0,
          width: 20.0,
        ),
      ),
      // SizedBox(width: 16.0),
      // GestureDetector(
      //   onTap: () {
      //     html.window.open("https://medium.com/@zubairehman.work", "Medium");
      //   },
      //   child: Image.network(
      //     Assets.evernote,
      //     color: Color(0xFF45405B),
      //     height: 20.0,
      //     width: 20.0,
      //   ),
      // ),
      // SizedBox(width: 16.0),
      // GestureDetector(
      //   onTap: () {
      //     html.window.open("https://github.com/zubairehman", "Github");
      //   },
      //   child: Image.network(
      //     Assets.google,
      //     color: Color(0xFF45405B),
      //     height: 20.0,
      //     width: 20.0,
      //   ),
      // ),
      // SizedBox(width: 16.0),
      // GestureDetector(
      //   onTap: () {
      //     html.window.open("https://twitter.com/zubair340", "Twitter");
      //   },
      //   child: Image.network(
      //     Assets.twitter,
      //     color: Color(0xFF45405B),
      //     height: 20.0,
      //     width: 20.0,
      //   ),
      // ),
    ],
  );
}

//other layouts
Widget _buildMediumScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 1, child: _buildContent(context)),
            ],
          ),
        ),
        _buildFooter(context)
      ],
    ),
  );
}

// _buildLargeScreen(BuildContext context) {   return IntrinsicHeight(
//   child: Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//       Expanded(
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Expanded(flex: 1, child: _buildContent(context)),
//             _buildIllustration(),
//           ],
//         ),
//       ),
//       _buildFooter(context)
//     ],
//   ),
// );
// }

Widget _buildLargeScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 1, child: _buildContent(context)),
              _buildIllustration(context),
            ],
          ),
        ),
        _buildFooter(context)
      ],
    ),
  );
}

Widget _buildIllustration(context) {
  return
      // Container(
      // width: MediaQuery.of(context).size.width * 0.3, //480.0
      // color: Colors.red,
      // );
      Image.network(
    Assets.home_image,
    height: MediaQuery.of(context).size.width * 0.3, //480.0
  );
}

//==== class
class Education {
  String from;
  String to;
  String organization;
  String post;

  Education(this.from, this.to, this.organization, this.post);
}
