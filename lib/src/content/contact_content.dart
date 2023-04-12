import 'dart:html';
import 'dart:ui' as ui;

import '../../src/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

const address =
    "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d967.6126950923731!2d-48.94356117081217!3d-2.9327489998664813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xde946c70fc5df9c6!2zMsKwNTUnNTcuOSJTIDQ4wrA1NiczNC45Ilc!5e1!3m2!1spt-BR!2sbr!4v1668441366642!5m2!1spt-BR!2sbr";

class ContactContent extends ResponsiveWidget {
  ContactContent({Key? key}) : super(key: key) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'google-maps',
        (int viewId) => IFrameElement()
          ..src = address
          ..style.border = 'none');
  }

  @override
  Widget buildDesktop(BuildContext context) => DesktopContactContent();

  @override
  Widget buildMobile(BuildContext context) => MobileContactContent();
}

class DesktopContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information Section",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                ],
              ),
            ),
            SizedBox(width: 24),
            Container(
              height: 400,
              width: 600,
              child: HtmlElementView(viewType: 'google-maps'),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contact Information Section",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(height: 25),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            ),
            SizedBox(height: 24),
            Container(
              height: 400,
              width: 400,
              child: HtmlElementView(viewType: 'google-maps', key: UniqueKey()),
            ),
          ],
        ),
      ),
    );
  }
}
