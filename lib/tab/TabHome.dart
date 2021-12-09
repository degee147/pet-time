import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_time/constants/ConstantColors.dart';
import 'package:pet_time/constants/ConstantWidgets.dart';
import 'package:pet_time/constants/Constants.dart';
import 'package:pet_time/constants/SizeConfig.dart';
import 'package:pet_time/data/DataFile.dart';
import 'package:pet_time/data/PrefData.dart';
import 'package:pet_time/model/DiscModel.dart';
import 'package:pet_time/model/SubCategoryModel.dart';
import 'package:pet_time/model/ModelTopCategory.dart';
import 'package:pet_time/model/ModelBlog.dart';
import 'package:pet_time/generated/l10n.dart';
import 'package:pet_time/screen/BookPetHotel.dart';
import 'package:pet_time/screen/ProductDetail.dart';
import 'package:pet_time/screen/ShoppingPage.dart';
import 'package:pet_time/screen/AdoptionList.dart';
import 'package:pet_time/screen/BookPetTreatment.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHome createState() => _TabHome();
}

class _TabHome extends State<TabHome> {
  List<ModelTopCategory> topCatList = [];
  double screenHeight = 50;
  List<DiscModel> discModelList = [];
  List<SubCategoryModel> subList = DataFile.getSubCategoryModel();
  List<DiscModel> adoptModelList = [];
  List<ModelBlog> blogLists = [];

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView(
              primary: true,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: padding, right: padding, top: padding),
                  child: RichText(
                    text: new TextSpan(
                      text: "Hello",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Constants.getPercentSize(screenHeight, 3),
                          fontFamily: Constants.fontsFamily),
                      children: <TextSpan>[
                        new TextSpan(
                            text: " User,",
                            style: TextStyle(
                                color: accentColors,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    Constants.getPercentSize(screenHeight, 3),
                                fontFamily: Constants.fontsFamily)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding / 3),
                  child: getCustomText(
                      S.of(context).whatAreYouLookingFor,
                      primaryTextColor,
                      1,
                      TextAlign.start,
                      FontWeight.normal,
                      Constants.getPercentSize1(screenHeight, 1.8)),
                ),
                Container(
                  height: topListHeight,
                  child: ListView.builder(
                    padding: EdgeInsets.all(
                        Constants.getPercentSize1(topListHeight, 5)),
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: topCatList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          switch (index) {
                            case 0:
                              PrefData().setSelectedMainCategory(
                                  Constants.SHOPPING_ID);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ShoppingPage(),
                              ));
                              break;
                            case 1:
                              PrefData().setSelectedMainCategory(
                                  Constants.TREATMENT_ID);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookPetTreatment(),
                              ));

                              break;
                            case 2:
                              PrefData().setSelectedMainCategory(
                                  Constants.PET_HOTEL_ID);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookPetHotel(),
                              ));
                              break;
                            case 3:
                              sendToAdopt();

                              break;
                          }
                        },
                        child: Container(
                          width: topListHeight -
                              Constants.getPercentSize1(topListHeight, 5),
                          height: topListHeight -
                              Constants.getPercentSize1(topListHeight, 5),
                          margin: EdgeInsets.all(
                              Constants.getPercentSize1(topListHeight, 5)),
                          decoration: BoxDecoration(
                              // color: Colors.grey,
                              // border:
                              //     Border.all(color: Colors.grey, width: 0.8),
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(color: shadowColor, blurRadius: 1.2)
                                // BoxShadow(color: "#B9B9B9".toColor(), blurRadius:1.2)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: topListItemHeight,
                                width: topListItemHeight,

                                child:
                                    // Padding(
                                    //   padding: EdgeInsets.all(Constants.getPercentSize1(
                                    //       topListItemHeight, 24)),
                                    //   child:
                                    Image.asset(
                                  Constants.assetsImagePath +
                                      topCatList[index].image,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                // ),
                              ),
                              getSpace(
                                  Constants.getPercentSize1(topListHeight, 5)),
                              getCustomText(
                                  topCatList[index].title,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  Constants.getPercentSize1(
                                      topListHeight - topListItemHeight, 20))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: getTitles(S.of(context).latestOffers),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: sliderHeight,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      aspectRatio: 1.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {});
                      },
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: imageSliders,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: padding),
                //   child: getTitles(S.of(context).bestSellingItems),
                // ),
                //best selling items
                // Container(
                //   height: sellingItemHeight,
                //   margin: EdgeInsets.all(
                //       Constants.getPercentSize(sellingItemHeight, 3)),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     primary: false,
                //     itemCount: subList.length,
                //     itemBuilder: (context, index) {
                //       SubCategoryModel _subCatModle = subList[index];
                //       return InkWell(
                //         onTap: () {
                //           Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => ProductDetail(_subCatModle),
                //           ));
                //         },
                //         child: Container(
                //           width: sellingItemWidth,
                //           height: double.infinity,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.all(Radius.circular(7)),
                //               color: cardColor,
                //               boxShadow: [
                //                 BoxShadow(color: shadowColor, blurRadius: 2)
                //               ]
                //               // border: Border.all(color: Colors.grey, width: 1),
                //               ),
                //           margin: EdgeInsets.all(
                //               Constants.getPercentSize(sellingItemHeight, 3)),
                //           padding: EdgeInsets.all(
                //               Constants.getPercentSize(sellingItemWidth, 5)),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Expanded(
                //                 child: ClipRRect(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(7)),
                //                   child: Image.asset(
                //                     Constants.assetsImagePath +
                //                         _subCatModle.image[0],
                //                     fit: BoxFit.cover,
                //                     width: double.infinity,
                //                     height: double.infinity,
                //                   ),
                //                 ),
                //                 flex: 1,
                //               ),
                //               getSpace(Constants.getPercentSize1(
                //                   sellingItemHeight, 2.5)),
                //               getCustomText(
                //                   _subCatModle.name,
                //                   textColor,
                //                   1,
                //                   TextAlign.start,
                //                   FontWeight.w400,
                //                   Constants.getPercentSize1(sellingItemHeight, 7)),
                //               Row(
                //                 children: [
                //                   getSpace(Constants.getPercentSize1(
                //                       sellingItemHeight, 1.2)),
                //                   getCustomText(
                //                       _subCatModle.priceCurrency +
                //                           _subCatModle.price.toString(),
                //                       colorOrange,
                //                       1,
                //                       TextAlign.start,
                //                       FontWeight.w600,
                //                       Constants.getPercentSize1(
                //                           sellingItemHeight, 8)),
                //                   Text(
                //                     _subCatModle.priceCurrency +
                //                         (_subCatModle.price - Constants.discountVal).toString(),
                //                     style: TextStyle(
                //                         color: primaryTextColor,
                //                         decoration: TextDecoration.lineThrough,
                //                         fontFamily: Constants.fontsFamily,
                //                         fontSize: Constants.getPercentSize1(
                //                             sellingItemHeight, 6),
                //                         fontWeight: FontWeight.w600),
                //                     maxLines: 1,
                //                   )
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
            GridView.count(
              primary: false,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("He'd have you all unravel at the"),
                  color: Colors.teal[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Heed not the rabble'),
                  color: Colors.teal[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.teal[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.teal[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution is coming...'),
                  color: Colors.teal[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.teal[600],
                ),
              ],
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
