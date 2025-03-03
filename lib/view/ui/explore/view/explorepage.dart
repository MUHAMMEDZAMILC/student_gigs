// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_gigs/utils/constants/appconstants.dart';
import 'package:student_gigs/utils/constants/colors.dart';
import 'package:student_gigs/utils/helper/help_screensize.dart';
import 'package:student_gigs/utils/theme/dimensions.dart';
import 'package:student_gigs/view/components/apdrpdwn.dart';
import 'package:student_gigs/view/components/appbar.dart';
import '../../../components/appbutton.dart';
import '../../../components/apptext.dart';

class ExploreScree extends StatefulWidget {
  const ExploreScree({super.key});

  @override
  State<ExploreScree> createState() => _ExploreScreeState();
}

class _ExploreScreeState extends State<ExploreScree> {
  String? category,location,salarytype;
  List<String> categorylist = [ 
    'Flutter Developer',
    'Graphics Designing',
    'Video Editer'
  ];
  List<String> locationlist = [ 
    'Rammaattukara',
    'Kondotty',
    'Perinthalmanna'
  ];
  List<String> salartlist = [ 
    'Per Hour',
    'Monthly',
    'Project Based'
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMn(
        titlename: AppConstants.appname,
        titleonly: true,isback: true,
       ),
      body: SizedBox(width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          children: [
            SizedBox(
              width: ScreenUtil.screenWidth,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ApDrpDwn(value: category, list: categorylist, onchange: (value) {
                          category = value;
                          setState(() {
                            
                          });
                        },label: 'Category',hinttext: 'Category',),
                      ),
                      gapHorizontal,
                      Center(child: Icon(CupertinoIcons.search))
                    ],
                  ),
                  gap,
                  Row(
                    children: [
                      Expanded(child: ApDrpDwn(value: location, list: locationlist, onchange: (value) {
                        location = value;
                        setState(() {
                          
                        });
                      },label: 'Location',hinttext: 'Location',)),
                      gapHorizontal,
                      Expanded(child: ApDrpDwn(value: salarytype, list: salartlist, onchange: (value) {
                        salarytype = value;
                        setState(() {
                          
                        });
                      },label: 'Salary Type',hinttext: 'Salary Type',)),
                    ],
                  ),
                ],
              ),
            ),
            gap,
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: paddingSmall),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorResources.textcolor.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorResources.scaffoldcolor,
                            boxShadow: [BoxShadow(color: ColorResources.textcolor.withOpacity(0.1),offset: Offset(2, 2),blurRadius: 4)]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(text: 'Exmedia',textalign: TextAlign.left,maxline: 2,color: ColorResources.textcolor.withOpacity(0.5),),
                                          gapSmall,
                                          AppText(text:'Flutter Developer',textalign: TextAlign.left,maxline: 2,weight: FontWeight.w500,),
                                          gap,
                                          Row(
                                            children: [
                                              Icon(CupertinoIcons.clock,color: ColorResources.GREEN,),gapHorizontal,
                                              AppText(text: 'Posted 4 days ago')
                                            ],
                                          ),
                                          gap,
                                          AppText(text: '400 Daily Rate',color: ColorResources.GREEN,weight: FontWeight.w500,)
                                        ],
                                      ),
                                    ),
                                    gapHorizontal,
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.bookmark_border_outlined,color: ColorResources.textcolor.withOpacity(0.4),),
                                    gap21,
                                    ApBtn(
                                      btncolor: ColorResources.seccolor,
                                      height: 40,
                                      onPressed: () {
                                      
                                    }, isValid: true,child: AppText(text: 'Appply',color: ColorResources.scaffoldcolor,),),
                                  ],
                                ))
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorResources.textcolor.withOpacity(0.2),

                              ),
                              gap,
                              Padding(
                                padding: const EdgeInsets.only(left:  padding),
                                child: AppText(text: 'Not Applied',color: ColorResources.textcolor.withOpacity(0.5),),
                              ),
                              gap,
                            ],
                          ),
                        ),
                      );
            },))

          ],
        ),
      ),),
    );
  }
}