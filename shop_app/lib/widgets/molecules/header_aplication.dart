
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';


class HeaderAplication extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.0),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: headerCustomPainter(),
            child: SafeArea(
              //minimum: EdgeInsets.(20),
                minimum: EdgeInsets.only(top: 0, left: 16),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(onPressed: Navigator.of(context).pop, icon: Icon(Icons.arrow_back_ios,color:Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Container(

                                child: Text("Gestion de ventas",
                                    style: TextStyles.white24BoldText,
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                        /*Padding(
                            padding: EdgeInsets.only(
                                left: (MediaQuery.of(context).size.width / 2) -
                                    50),
                            child: CustomImage(
                              mesures: [80,80],
                              image: ImageUrl.rocket_lines,
                              rounded: 0,
                              type: 1,
                              color: ColorsDefinitions.white,
                              angle: 0.1,
                            )
                        )*/
                      ],
                    )
                  ],
                )),
          ),
        ),
        /*Padding(
            padding:
            EdgeInsets.only(left: (MediaQuery.of(context).size.width / 8)),
            child: CustomImage(
              image: ImageUrl.sun,
              rounded: 0,
              type: 1,
              mesures: [35, 35],
              color: ColorsDefinitions.shapeGreenInnova,
            )),
        Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width * 0.75), top: 100),
            child: CustomImage(
              image: ImageUrl.rectangule,
              rounded: 0,
              type: 1,
              mesures: [30, 30],
              color: ColorsDefinitions.shapeGreenInnova,
            )),
        Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width) * 0.80),
            child: CustomImage(
              image: ImageUrl.sun,
              rounded: 0,
              type: 1,
              mesures: [30, 30],
              color: ColorsDefinitions.orange,
            )),
        Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 4), top: 80),
            child: CustomImage(
              image: ImageUrl.circle,
              rounded: 0,
              type: 1,
              mesures: [15, 15],
              color: ColorsDefinitions.orange,
            )),
        Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width * 0.90), top: 70),
            child: CustomImage(
              image: ImageUrl.circle,
              rounded: 0,
              type: 1,
              mesures: [15, 15],
              color: ColorsDefinitions.alert,
            )),
        Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 11), top: 80),
            child: CustomImage(
              image: ImageUrl.rectangule,
              rounded: 0,
              type: 1,
              mesures: [30, 30],
              color: ColorsDefinitions.alert,
              angle: 2,
            )),*/
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class headerCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = ColorsDefinitions.gray_second
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
    final path = new Path();

    path.lineTo(0.1, size.height * 0.71);

    path.quadraticBezierTo(size.width * 0.02, size.height * 0.96,
        size.width * 0.15, size.height * 0.96);

    path.lineTo(size.width * 0.92, size.height * 0.90);

    path.quadraticBezierTo(
        size.width * 0.97, size.height * 0.89, size.width, size.height * 0.73);
    path.lineTo(size.width, 0);

    // path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(headerCustomPainter oldelegate) {
    return true;
  }
}
