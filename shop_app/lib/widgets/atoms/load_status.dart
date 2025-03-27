
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';

class LoadStatus {
  Widget load(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //backgroundColor: Colors.transparent ,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: ColorsDefinitions.orange,
          rightDotColor: ColorsDefinitions.blue_genie,
          size: 60,
        ),
      ),
    );
  }

  Widget loadDots(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //backgroundColor: Colors.transparent ,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Center(
        child: LoadingAnimationWidget.progressiveDots(
          color: ColorsDefinitions.blue_genie,
          size: 40,
        ),
      ),
    );
  }

  Future loadButton(BuildContext context, {String text = ""}) async {
    return await showDialog(
        context: context,
        builder: (builder) => Container(
          width: double.infinity,
          height: double.infinity,
          //backgroundColor: Colors.transparent ,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.flickr(
                    leftDotColor: ColorsDefinitions.orange,
                    rightDotColor: ColorsDefinitions.blue_genie,
                    size: 60,
                  ),
                  Text(
                    text,
                    style: TextStyles.normalText,
                  )
                ],
              )),
        ));
  }
/*
  infoDown({title, color, icon}) {
    BuildContext context =
    NavigationService.instance.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 7),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(title, textAlign: TextAlign.center),
          ),
          icon,
        ],
      ),
      backgroundColor: color,
    ));
  }*/
}
