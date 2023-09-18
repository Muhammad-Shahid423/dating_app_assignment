import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dating_app_assignment/common/values/colors.dart';
import 'package:dating_app_assignment/common/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/app_event.dart';
import '../../../bloc/app_state.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryBackground,
          body: buildPage(state.index),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            backgroundColor: AppColors.primary_bg,
            activeColor: AppColors.primaryElement,
            shadowColor: AppColors.primarySecondaryBG,
            initialActiveIndex: state.index,
            items: [
              TabItem(icon: Image.asset("assets/icons/ic_home.png", color: state.index == 0 ? AppColors.primaryElement : AppColors.primarySecondaryBG,), title: '홈'),
              TabItem(icon: Image.asset("assets/icons/ic_location_grey.png", color: state.index == 1 ? AppColors.primaryElement : null,), title: '스팟'),
              TabItem(icon: Image.asset("assets/icons/ic_star_black.png")),
              TabItem(icon: Image.asset("assets/icons/ic_chat.png", color: state.index == 3 ? AppColors.primaryElement : AppColors.primarySecondaryBG,), title: '채팅'),
              TabItem(icon: Image.asset("assets/icons/ic_user.png", color: state.index == 4 ? AppColors.primaryElement : AppColors.primarySecondaryBG,), title: '마이'),
            ],
            onTap: (int i) => setState(() {
              context.read<AppBloc>().add(TriggerAppEvent(i));
            }),
          ),
        );
      }
    );
  }
}
