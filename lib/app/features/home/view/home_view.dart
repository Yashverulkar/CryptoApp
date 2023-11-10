import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gweiland_flutter_task/app/components/dropDownButton.dart';
import 'package:gweiland_flutter_task/app/features/home/bloc/home_bloc.dart';
import 'package:gweiland_flutter_task/app/utils/app_colors.dart';
import 'package:gweiland_flutter_task/app/utils/app_helper.dart';
import 'package:gweiland_flutter_task/app/utils/assets_images.dart';
import 'package:gweiland_flutter_task/app/utils/ui_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    homeBloc.add(HomeInitialEvent());
    return Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0.sp),
          child: AppBar(
            // leadingWidth: 0,
            elevation: 0,
            backgroundColor: AppColors.primaryWhite,
            title: Padding(
              padding: EdgeInsets.only(top: 16.sp),
              child: Text(
                "Exchanges",
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
            ),

            actions: [
              Padding(
                padding: EdgeInsets.only(top: 16.sp),
                child: IconButton(
                  onPressed: () {
                    print("yash");
                  },
                  icon: Icon(
                    Icons.settings,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.sp),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none,
                      color: AppColors.textBlack),
                ),
              ),
            ],
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case HomeLoadingSuccessState:
                final successState = state as HomeLoadingSuccessState;
                return Container(
                    padding: EdgeInsets.only(
                        left: 16.sp, right: 16.sp, top: 16.sp, bottom: 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50.sp,
                                  // width: screenWidthInPercentage(context, percentage: 100),
                                  decoration: BoxDecoration(
                                      color: AppColors.searchBarBAckgroundGrey,
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: AppColors.filterGrey,
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      Text(
                                        "Search Cryptocurrency",
                                        style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.filterGrey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.sp,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: const Text('Filter'),
                                          content: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Form(
                                              child: Column(
                                                children: <Widget>[
                                                  RadioListTile<String>(
                                                    title:
                                                        const Text('Default'),
                                                    value: 'Default',
                                                    groupValue:
                                                        homeBloc.filterSort,
                                                    onChanged: (value) {
                                                      Navigator.pop(context);
                                                      homeBloc.add(
                                                          HomeRadioClickEvent(
                                                              filterType:
                                                                  value!,
                                                              context));
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    title: const Text(
                                                        'Price High To Low'),
                                                    value: 'Price High To Low',
                                                    groupValue:
                                                        homeBloc.filterSort,
                                                    onChanged: (value) {
                                                      Navigator.pop(context);
                                                      homeBloc.add(
                                                          HomeRadioClickEvent(
                                                              filterType:
                                                                  value!,
                                                              context));
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    title: const Text(
                                                        'Price Low To High'),
                                                    value: 'Price Low To High',
                                                    groupValue:
                                                        homeBloc.filterSort,
                                                    onChanged: (value) {
                                                      Navigator.pop(context);
                                                      homeBloc.add(
                                                          HomeRadioClickEvent(
                                                              filterType:
                                                                  value!,
                                                              context));
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    title: const Text(
                                                        'Volume Change High To Low'),
                                                    value:
                                                        'Volume Change High To Low',
                                                    groupValue:
                                                        homeBloc.filterSort,
                                                    onChanged: (value) {
                                                      Navigator.pop(context);
                                                      homeBloc.add(
                                                          HomeRadioClickEvent(
                                                              filterType:
                                                                  value!,
                                                              context));
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    title: const Text(
                                                        'Volume Change Low to High'),
                                                    value:
                                                        'Volume Change Low to High',
                                                    groupValue:
                                                        homeBloc.filterSort,
                                                    onChanged: (value) {
                                                      Navigator.pop(context);
                                                      homeBloc.add(
                                                          HomeRadioClickEvent(
                                                              filterType:
                                                                  value!,
                                                              context));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // actions: [
                                          //   ElevatedButton(
                                          //       child: Text("Submit"),
                                          //       onPressed: () {
                                          //         // your code
                                          //       })
                                          // ],
                                        );
                                      });
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.sp),
                                  height: 50.sp,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.filterGrey,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(50.sp)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_list_sharp,
                                        color: AppColors.filterGrey,
                                      ),
                                      Text(
                                        "Fliter",
                                        style: GoogleFonts.inter(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.filterGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpacingRegular,
                          Row(
                            children: [
                              Text(
                                "Cryptocurrency",
                                style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(
                                width: 16.sp,
                              ),
                              Text(
                                "NFC",
                                style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.filterGrey,
                                ),
                              ),
                            ],
                          ),
                          verticalSpacingSmall,
                          Container(
                              // height: 120.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.backgroundGreen,
                              ),
                              // padding: EdgeInsets.all(16.sp),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          AssetsImages.btcImage,
                                          fit: BoxFit.fill,
                                          // height: 50.sp,
                                          width: screenWidthInPercentage(
                                            context,
                                            percentage: 0.2,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            verticalSpacingRegular,
                                            Text(
                                              AppHelper.formatNumber(state
                                                  .cryptocurrencyList
                                                  .first
                                                  .quote!
                                                  .usd!
                                                  .price!),
                                              style: GoogleFonts.inter(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.textBlack,
                                              ),
                                            ),
                                            verticalSpacingTiny,
                                            Text(
                                              "${state.cryptocurrencyList.first.quote?.usd?.percentChange24H?.toStringAsFixed(2) ?? ""} %",
                                              style: GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.firstGreen,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    AssetsImages.firstBackgound,
                                    width: screenWidthInPercentage(context,
                                        percentage: 100),
                                    fit: BoxFit.fill,
                                  )
                                ],
                              )),
                          verticalSpacingRegular,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Cryptocurrency",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              Text(
                                "View All",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.filterGrey,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: state.cryptocurrencyList.length - 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.sp, vertical: 16.sp),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CircleAvatar(
                                            radius: 25.sp, // Image radius
                                            // backgroundImage:
                                            // NetworkImage('imageUrl'),
                                          ),
                                        ),
                                        horizontalSpacingSmall,
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                state
                                                        .cryptocurrencyList[
                                                            index + 1]
                                                        .name ??
                                                    "",
                                                style: GoogleFonts.inter(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                              verticalSpacingSmall,
                                              Text(
                                                state
                                                        .cryptocurrencyList[
                                                            index + 1]
                                                        .symbol ??
                                                    "",
                                                style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.filterGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        horizontalSpacingSmall,
                                        Expanded(
                                          child: Container(
                                            child: (state
                                                        .cryptocurrencyList[
                                                            index]
                                                        .quote!
                                                        .usd!
                                                        .percentChange24H! <
                                                    0)
                                                ? Image.asset(
                                                    AssetsImages.negativeGraph)
                                                : Image.asset(
                                                    AssetsImages.positiveGraph),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${AppHelper.formatNumber(state.cryptocurrencyList[index + 1].quote!.usd!.price!)} USD",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.textBlack,
                                                  ),
                                                ),
                                                verticalSpacingSmall,
                                                Text(
                                                  "${state.cryptocurrencyList[index + 1].quote?.usd?.percentChange24H?.toStringAsFixed(2) ?? ""} %",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: (state
                                                                  .cryptocurrencyList[
                                                                      index]
                                                                  .quote!
                                                                  .usd!
                                                                  .percentChange24H! <
                                                              0)
                                                          ? AppColors.red
                                                          : AppColors
                                                              .firstGreen),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ));
              default:
                return SizedBox();
            }
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.sp),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 6, right: 6, bottom: 6),
          height: 80.sp,
          decoration: BoxDecoration(
            color: AppColors.textBlack,
            borderRadius: BorderRadius.circular(30.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.emoji_emotions,
                    color: AppColors.offWhite,
                    size: 25.sp,
                  ),
                  verticalSpacingTiny,
                  Text(
                    "E-Shop",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.offWhite,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.swap_horiz_sharp,
                    color: AppColors.offWhite,
                    size: 25.sp,
                  ),
                  verticalSpacingTiny,
                  Text(
                    "Exchange",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.offWhite,
                    ),
                  )
                ],
              ),
              Image.asset(
                AssetsImages.bNavCenter,
                width: 65.sp,
                // height: 50,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rocket_launch_outlined,
                    color: AppColors.offWhite,
                    size: 25.sp,
                  ),
                  verticalSpacingTiny,
                  Text(
                    "Launchpads",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.offWhite,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet_outlined,
                    color: AppColors.offWhite,
                    size: 25.sp,
                  ),
                  verticalSpacingTiny,
                  Text(
                    "Wallet",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.offWhite,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
