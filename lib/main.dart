import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/presentation/home_page/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        color: Color(0xFFF7F8FA),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:MediaQuery.of(context).size.width*0.1 ),
              child: child!),
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        // initialRoute: "/",
        home: HomePage(),

      ),
    );
  }
}


//       // Example: if the screen is bigger than the Mobile breakpoint, build full width AppBar icons and labels.
//     if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
//     FullWidthAppBarItems()
//
// // Booleans
//     ResponsiveBreakpoints.of(context).isDesktop;
//     ResponsiveBreakpoints.of(context).isTablet;
//     ResponsiveBreakpoints.of(context).isMobile;
//     ResponsiveBreakpoints.of(context).isPhone;
//
// // Conditionals
//     ResponsiveBreakpoints.of(context).equals(DESKTOP)
//     ResponsiveBreakpoints.of(context).largerThan(MOBILE)
//     ResponsiveBreakpoints.of(context).smallerThan(TABLET)
//     ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
//     ...