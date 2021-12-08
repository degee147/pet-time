import 'package:flutter/material.dart';
import 'package:pet_time/constants/ConstantColors.dart';
import 'package:pet_time/constants/ConstantWidgets.dart';
import 'package:pet_time/constants/Constants.dart';
import 'package:pet_time/generated/l10n.dart';
import 'package:pet_time/screen/LoginPage.dart';
import 'package:pet_time/screen/RegisterPage.dart';


class ChoosePage extends StatefulWidget {
  @override
  _ChoosePage createState() => _ChoosePage();
}

class _ChoosePage extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.03;
    double left = MediaQuery.of(context).size.width * 0.05;
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                        Constants.assetsImagePath + "selectionbg.png"),
                  ),
                ),
              ),
              // Expanded(
              //   child:
              Container(
                color: Colors.black54,
                padding: EdgeInsets.only(bottom: margin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: margin,
                            bottom: margin,
                            left: left,
                            right: left),
                        height: 50,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Center(
                              child: getCustomText(
                                  S.of(context).register,
                                  Colors.white,
                                  1,
                                  TextAlign.center,
                                  FontWeight.w900,
                                  15)),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            bottom: margin, left: left, right: left),
                        height: 50,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Center(
                            child: getCustomText(
                                S.of(context).login,
                                Colors.black87,
                                1,
                                TextAlign.center,
                                FontWeight.w900,
                                15),
                          ),
                        )),
                  ],
                ),
              )
              // flex: 1,
              // )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Constants.stopApp();
        return false;
      },
    );
  }
}
