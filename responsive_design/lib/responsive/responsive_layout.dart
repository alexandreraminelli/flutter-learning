import 'package:flutter/material.dart';
import 'package:responsive_design/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  // Widgets para mobile e desktop
  final Widget mobileBody;
  final Widget desktopBody;

  // Construtor
  const ResponsiveLayout({required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
