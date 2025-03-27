import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/enums/enum_response_status.dart';

class ResponseStatusMolecule {

  Future<void> dialogBuilderSuccess(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 250,
            child: AlertDialog(
              backgroundColor: Color(0xFFAFC1B1),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.green,size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("${EnumResponseStatus.SUCCESS.description}"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }

  Future<void> dialogBuilderError(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 250,
            child: AlertDialog(
              backgroundColor: Color(0xFFC39179),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Color(0xFFA53922),size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("${EnumResponseStatus.ERROR.description}"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }

  Future<void> dialogBuilderErrorServer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 250,
            child: AlertDialog(
              backgroundColor: Color(0xFFC39179),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Color(0xFFA53922),size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("${EnumResponseStatus.ERRORSERVIDOR.description}"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }

  Future<void> dialogBuilderEmpty(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 250,
            child: AlertDialog(
              backgroundColor: Color(0xFFE8D45D),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty, color: Color(0xFFA8996B),size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("${EnumResponseStatus.EMPTY.description}"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }

  Future<void> dialogBuilderCustomer(BuildContext context, {descriptin, icon}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 270,
            child: AlertDialog(
              backgroundColor: Color(0xFFDDF3DF),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Color(0xFFE1772A),size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("${descriptin}"),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }

  Future<void> dialogBuilderLoading(BuildContext context, {descriptin, icon}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 350,
            height: 200,
            child: AlertDialog(
              backgroundColor: Color(0xFFDDF3DF),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text("Procesando ..."),
                  ),

                ],
              ),

            ),
          ),
        );
      },
    );
  }

}