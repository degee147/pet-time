// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_time/constants/ConstantColors.dart';
import 'package:pet_time/constants/ConstantWidgets.dart';
import 'package:pet_time/constants/Constants.dart';
import 'package:pet_time/constants/SizeConfig.dart';
import 'package:pet_time/data/DataFile.dart';
import 'package:pet_time/model/ProfileModel.dart';
import 'package:pet_time/data/PrefData.dart';
import 'package:pet_time/model/DiscModel.dart';
import 'package:pet_time/model/SubCategoryModel.dart';
import 'package:pet_time/model/ModelTopCategory.dart';
import 'package:pet_time/model/ModelBlog.dart';
import 'package:pet_time/generated/l10n.dart';
// import 'package:pet_time/screen/BookPetHotel.dart';
// import 'package:pet_time/screen/ShoppingPage.dart';
import 'package:pet_time/screen/AdoptionList.dart';
// import 'package:pet_time/screen/BookPetTreatment.dart';
import 'package:pet_time/model/ModelAdoption.dart';

class TabDiarioMedico extends StatefulWidget {
  @override
  _TabDiarioMedico createState() => _TabDiarioMedico();
}

class _TabDiarioMedico extends State<TabDiarioMedico> {
  List<ModelTopCategory> topCatList = [];
  double screenHeight = 50;
  List<DiscModel> discModelList = [];
  List<SubCategoryModel> subList = DataFile.getSubCategoryModel();
  List<DiscModel> adoptModelList = [];
  List<ModelBlog> blogLists = [];
  ProfileModel profileModel = DataFile.getProfileModel();

  @override
  void initState() {
    super.initState();
    discModelList = DataFile.getDiscModel();
    adoptModelList = DataFile.getAdoptModel();
  }

  Widget getTitles(String str) {
    return getCustomText(str, textColor, 1, TextAlign.start, FontWeight.w500,
        Constants.getPercentSize1(SizeConfig.safeBlockVertical * 100, 2));
  }

  List<ModelAdoption> allAdoptionList = DataFile.getAllAdoptionList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    PrefData().setSelectedMainCategory(Constants.NONE_CAT);

    topCatList = DataFile.getTopCategoryList(context);
    blogLists = DataFile.getBlogList(context);
    screenHeight = SizeConfig.safeBlockVertical * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal * 100;
    double padding = Constants.getPercentSize1(screenWidth, 1.6);
    double topListHeight = screenWidth / 4;
    double topListItemHeight = Constants.getPercentSize(topListHeight, 40);
    double sliderHeight = Constants.getPercentSize(screenHeight, 20);
    double slider2Height = Constants.getPercentSize(screenHeight, 27);
    double sellingItemWidth = SizeConfig.safeBlockHorizontal * 42;
    double sellingItemHeight = SizeConfig.safeBlockHorizontal * 50;
    double containerHeight = Constants.getPercentSize1(screenWidth, 28);
    double subContainerHeight =
        Constants.getPercentSize1(containerHeight, Constants.subContainer);

    double cellMargin2 = 7;
    double cellMargin = 7;

    var _crossAxisSpacing2 = 8.0;
    var _crossAxisSpacing = 8.0;

    var _crossAxisCount2 = 3;
    var _crossAxisCount = 2;
    var bottomDialogTextSize = SizeConfig.safeBlockVertical * 45;
    var bottomDialogTextSizeFilter = SizeConfig.safeBlockVertical * 55;

    var cellHeight = SizeConfig.safeBlockHorizontal * 58;
    var cellHeight2 = Constants.getPercentSize1(bottomDialogTextSizeFilter, 13);
    var _screenWidth = MediaQuery.of(context).size.width;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _width2 =
        (_screenWidth - ((_crossAxisCount2 - 1) * _crossAxisSpacing2)) /
            _crossAxisCount2;
    var _aspectRatio = _width / cellHeight;
    var _aspectRatio2 = _width2 / cellHeight2;
    double mainCatWidth = (SizeConfig.safeBlockHorizontal * 50) -
        (cellMargin * 2 + _crossAxisSpacing);
    double mainCatHeight = cellHeight;

    final List<Widget> imageSliders = discModelList
        .map((item) => Container(
                child: Container(
              margin: EdgeInsets.all(7),
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 3),
                          width: MediaQuery.of(context).size.width * 1,
                          // margin: EdgeInsets.all(
                          //     MediaQuery.of(context).size.width * 0.05),
                          //
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  Constants.assetsImagePath + item.image),
                              fit: BoxFit.cover,
                            ),
                          ),

                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        Constants.assetsImagePath +
                                            "bg_shape.png",
                                      ),
                                      // colorFilter: ColorFilter.mode(
                                      //     Colors.black.withOpacity(0.5),
                                      //     BlendMode.srcOver),
                                      fit: BoxFit.cover)),
                              padding: EdgeInsets.only(right: 5),
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: Constants.getPercentSize(
                              //         SizeConfig.safeBlockHorizontal * 40, 2)),
                              width: SizeConfig.safeBlockHorizontal * 40,
                              child: Row(
                                children: [
                                  getHorizonSpace(Constants.getPercentSize(
                                      SizeConfig.safeBlockHorizontal * 40, 24)),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        getSpace(Constants.getPercentSize(
                                            sliderHeight, 3)),
                                        Padding(
                                          padding: EdgeInsets.all(0),
                                          child: getCustomText(
                                              item.name,
                                              Colors.white,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w600,
                                              Constants.getPercentSize(
                                                  sliderHeight, 7)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(0),
                                          child: getCustomText(
                                              item.offText,
                                              Colors.white,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w400,
                                              Constants.getPercentSize(
                                                  sliderHeight, 6)),
                                        ),
                                        getSpace(Constants.getPercentSize1(
                                            sliderHeight, 1.5))
                                      ],
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            )))
        .toList();

    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          primary: true,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: padding, right: padding, top: padding),
              child: RichText(
                text: new TextSpan(
                    text: "Diario Medico",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Constants.getPercentSize(screenHeight, 3),
                        fontFamily: Constants.fontsFamily)),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: padding, vertical: padding / 3),
            //   child: getCustomText(
            //       S.of(context).whatAreYouLookingFor,
            //       primaryTextColor,
            //       1,
            //       TextAlign.start,
            //       FontWeight.normal,
            //       Constants.getPercentSize1(screenHeight, 1.8)),
            // ),

            Container(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Container(
                  height: sliderHeight,
                  margin: EdgeInsets.all(7),
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 3),
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage(Constants.assetsImagePath +
                                      adoptModelList[0].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: SizeConfig.safeBlockHorizontal * 3),
                              // width: SizeConfig.safeBlockHorizontal * 45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Expanded(
                                      //   child:
                                      Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 45,
                                        color: Colors.black54,
                                        padding: EdgeInsets.only(left: 7),
                                        child: getCustomText(
                                            "Pet name",
                                            Colors.white,
                                            2,
                                            TextAlign.start,
                                            FontWeight.w700,
                                            Constants.getPercentSize1(
                                                SizeConfig.safeBlockHorizontal *
                                                    40,
                                                10)),
                                      ),
                                      // , flex: 1,),
                                      // Container(
                                      //   padding: EdgeInsets.only(right: 3),
                                      //   width:
                                      //       SizeConfig.safeBlockHorizontal * 25,
                                      //   // width: SizeConfig.safeBlockHorizontal * 30,
                                      //   child: getButtonWithColorWithSize(
                                      //       S.of(context).adoptNow,
                                      //       accentColors,
                                      //       Constants.getPercentSize1(
                                      //           slider2Height, 2),
                                      //       Constants.getPercentSize1(
                                      //           SizeConfig.safeBlockHorizontal *
                                      //               30,
                                      //           9),
                                      //       // SizeConfig.safeBlockHorizontal * 30, 9),
                                      //       () {
                                      //     sendToAdopt();
                                      //   }),
                                      // ),
                                      // getHorizonSpace(1)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                )),
            getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(
                    Constants.getPercentSize1(containerHeight, 5)),
                width: double.infinity,
                height: containerHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: cardColor,
                    boxShadow: [BoxShadow(color: shadowColor, blurRadius: 2)]
                    // border: Border.all(
                    //   color: Colors.grey,
                    // ),
                    // borderRadius:
                    //     BorderRadius.all(Radius.circular(7))

                    ),
                padding: EdgeInsets.all(
                    Constants.getPercentSize1(containerHeight, 7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Container(
                        width: Constants.getPercentSize1(containerHeight, 90),
                        height: Constants.getPercentSize1(containerHeight, 90),
                        child: Image.asset(
                          Constants.assetsImagePath + profileModel.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    getHorizonSpace(Constants.getPercentSize1(screenWidth, 3)),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomText(
                              'Visitos of Veterinario',
                              textColor,
                              1,
                              TextAlign.start,
                              FontWeight.bold,
                              Constants.getPercentSize1(containerHeight, 13)),
                          getCustomText(
                              'some description of pet',
                              primaryTextColor,
                              1,
                              TextAlign.start,
                              FontWeight.w400,
                              Constants.getPercentSize1(containerHeight, 10)),
                          getSpace(
                              Constants.getPercentSize1(containerHeight, 2)),
                          Container(
                            height: subContainerHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.all(
                                      Constants.getPercentSize1(
                                          subContainerHeight, 4)),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: lightPrimaryColors),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      getCustomText(
                                          S.of(context).AGE,
                                          primaryTextColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.topTxt)),
                                      getCustomText(
                                          '6 months',
                                          textColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.bottomTxt))
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.all(
                                      Constants.getPercentSize1(
                                          subContainerHeight, 4)),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: lightPrimaryColors),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      getCustomText(
                                          S.of(context).SEX,
                                          primaryTextColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.topTxt)),
                                      getCustomText(
                                          'Male',
                                          textColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.bottomTxt))
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.all(
                                      Constants.getPercentSize1(
                                          subContainerHeight, 4)),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: lightPrimaryColors),
                                  // color: "#ECEDFA".toColor()),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      getCustomText(
                                          S.of(context).WEIGHT,
                                          primaryTextColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.topTxt)),
                                      getCustomText(
                                          '5kg',
                                          textColor,
                                          1,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          Constants.getPercentSize1(
                                              subContainerHeight,
                                              Constants.bottomTxt))
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            
          ],
        ),
      ),
    );
  }

  void sendToAdopt() {
    PrefData().setSelectedMainCategory(Constants.ADOPTION_ID);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdoptionList(),
    ));
  }
}
