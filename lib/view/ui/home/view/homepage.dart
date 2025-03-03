import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:student_gigs/utils/constants/appconstants.dart';
import 'package:student_gigs/utils/constants/colors.dart';
import 'package:student_gigs/utils/helper/help_screensize.dart';
import 'package:student_gigs/utils/helper/pagenavigator.dart';
import 'package:student_gigs/utils/theme/dimensions.dart';
import 'package:student_gigs/view/components/appbar.dart';
import 'package:student_gigs/view/components/appbutton.dart';
import 'package:student_gigs/view/components/apptext.dart';
import 'package:student_gigs/view/ui/explore/view/explorepage.dart';
import 'package:student_gigs/view/ui/home/model/homecaro_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List jobs = [
    'Grphics Designer',
    'Gaming and Sport',
    'Software',
    'Teacher',
    'Electritian'
  ];
  List<HomeCaro> imags = [
    HomeCaro(
        title: 'Explore Gigs',
        subtitle: 'Find Part -Time Jobs',
        img:
            "https://server.studentsgigs.com/media/slider_images/employee.jpg"),
    HomeCaro(
        title: 'Hire Student Talent',
        subtitle: 'Connect Skilled Students',
        img:
            "https://server.studentsgigs.com/media/slider_images/employer.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMn(
        titlename: AppConstants.appname,
        titleonly: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenUtil.screenWidth,
                  height: ScreenUtil.screenHeight! * 0.3,
                  child: ExpandableCarousel(
                    options: ExpandableCarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: TreeSliver.defaultAnimationCurve,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1,
                        showIndicator: false),
                    items: imags.map((i) {
                      return Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            width: ScreenUtil.screenWidth,
                            height: ScreenUtil.screenHeight! * 0.3,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(i.img),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: ScreenUtil.screenWidth,
                            height: ScreenUtil.screenHeight! * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                color:
                                    ColorResources.textcolor.withOpacity(0.4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: i.title ?? '',
                                  weight: FontWeight.w600,
                                  color: ColorResources.scaffoldcolor,
                                  size: 25,
                                  maxline: 2,
                                ),
                                gap,
                                AppText(
                                  text: i.subtitle ?? '',
                                  color: ColorResources.scaffoldcolor,
                                ),
                                gap21,
                                ApBtn(
                                  width: ScreenUtil.screenWidth! * 0.5,
                                  height: 45,
                                  onPressed: () {
                                    Screen.open(context, ExploreScree());
                                  },
                                  isValid: true,
                                  child: AppText(
                                    text: 'Explore',
                                    color: ColorResources.textcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                gap21,
                AppText(
                  text: 'Trending Jobs',
                  size: 20,
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  width: ScreenUtil.screenWidth,
                  height: ScreenUtil.screenHeight! * 0.17,
                  child: ListView.builder(
                    itemCount: jobs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(paddingSmall),
                        child: Container(
                          width: ScreenUtil.screenWidth! * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorResources.textcolor
                                      .withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: AppText(
                              text: jobs[index],
                              textalign: TextAlign.left,
                              maxline: 2,
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                gap,
                AppText(
                  text: 'Popular Jobs',
                  size: 20,
                  weight: FontWeight.w500,
                ),
                gap,
                SizedBox(
                  width: ScreenUtil.screenWidth,
                  child: Expanded(
                    flex: 2,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(paddingSmall),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorResources.textcolor
                                        .withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10),
                                color: ColorResources.scaffoldcolor,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorResources.textcolor
                                          .withOpacity(0.1),
                                      offset: Offset(2, 2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: 'Exmedia',
                                          textalign: TextAlign.left,
                                          maxline: 2,
                                          color: ColorResources.textcolor
                                              .withOpacity(0.5),
                                        ),
                                        gapSmall,
                                        AppText(
                                          text: jobs[index],
                                          textalign: TextAlign.left,
                                          maxline: 2,
                                          weight: FontWeight.w500,
                                        ),
                                        gap,
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.clock,
                                              color: ColorResources.GREEN,
                                            ),
                                            gapHorizontal,
                                            AppText(text: 'Posted 4 days ago')
                                          ],
                                        ),
                                        gap,
                                        AppText(
                                          text: '400 Daily Rate',
                                          color: ColorResources.GREEN,
                                          weight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ),
                                  gapHorizontal,
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border_outlined,
                                        color: ColorResources.textcolor
                                            .withOpacity(0.4),
                                      ),
                                      gap21,
                                      ApBtn(
                                        btncolor: ColorResources.seccolor,
                                        height: 40,
                                        onPressed: () {},
                                        isValid: true,
                                        child: AppText(
                                          text: 'Appply',
                                          color: ColorResources.scaffoldcolor,
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gap,
                ApBtn(
                  onPressed: () {},
                  isValid: true,
                  child: AppText(
                    text: "More Jobs",
                    color: ColorResources.scaffoldcolor,
                  ),
                  btncolor: ColorResources.seccolor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
