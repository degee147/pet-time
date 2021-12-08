import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_time/HomeScreen.dart';
import 'package:pet_time/constants/ConstantWidgets.dart';
import 'package:pet_time/screen/RateProduct.dart';
import 'package:pet_time/constants/ConstantColors.dart';
import 'package:pet_time/constants/Constants.dart';
import 'package:pet_time/constants/SizeConfig.dart';
import 'package:pet_time/data/DataFile.dart';
import 'package:pet_time/generated/l10n.dart';
import 'package:pet_time/model/AddressModel.dart';
import 'package:pet_time/model/CardModel.dart';


class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPage createState() {
    return _ThankYouPage();
  }
}

class _ThankYouPage extends State<ThankYouPage> {
  AddressModel addressList = DataFile.getAddressList()[0];
  CardModel cardList = DataFile.getCardList()[0];

  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList()[0];
    addressList = DataFile.getAddressList()[0];
    setState(() {});
  }

  Future<bool> _requestPop() {
    // Navigator.of(context).pop();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen(0)));

    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;
    double size = SizeConfig.safeBlockVertical * 30;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: Text(""),
            automaticallyImplyLeading: false,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.close,
            //       color: Colors.black87,
            //     ),
            //     onPressed: () {
            //       _requestPop();
            //     },
            //   )
            // ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset(Constants.assetsImagePath+'image.png',height: size),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                            style: new TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: Constants.fontsFamily,
                              color: primaryTextColor,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: 'Your order'),
                              new TextSpan(
                                  text: ' #345678 ',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: textColor)),
                              new TextSpan(text: 'is Completed.'),
                            ],
                          ),
                        ),
                      ),
                      // RichText(
                      //   textAlign: TextAlign.center,
                      //   text: new TextSpan(
                      //     style: new TextStyle(
                      //       fontSize: 12,
                      //       fontFamily: Constants.fontsFamily,
                      //       color:primaryTextColor,
                      //     ),
                      //     children: <TextSpan>[
                      //       new TextSpan(
                      //           text: 'Please check the Delivery status at'),
                      //       new TextSpan(
                      //           recognizer: new TapGestureRecognizer()..onTap = () {
                      //             // Navigator.push(
                      //             //     context,
                      //             //     MaterialPageRoute(
                      //             //       builder: (context) => MyOrderPage(),
                      //             //     ));
                      //           },
                      //
                      //           text: '\nOrder Tracking ',
                      //           style: new TextStyle(
                      //               decoration: TextDecoration.underline,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 14,
                      //               color: textColor)),
                      //       new TextSpan(text: ' pages.'),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  flex: 1,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.all(leftMargin),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(

                          child: getCustomTextWithoutAlign(S.of(context).continueStr,
                              Colors.white, FontWeight.w900, 15),

                          // child: Text(
                          //   S.of(context).continueShopping,
                          //   style: TextStyle(
                          //       fontFamily: ConstantData.fontFamily,
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: ConstantData.font15Px,
                          //       color: Colors.white,
                          //       decoration: TextDecoration.none),
                          // ),
                        ),
                      )
                    ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RateProduct()));
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
