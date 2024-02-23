import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:myapp/src/features/common/logic/lifecycle_mixin.dart';
import 'package:myapp/src/features/dashboard/widget/bottom_navigation_bar.dart';
import 'package:myapp/src/features/dashboard/logic/dashboard_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
    required this.currentItem,
    required this.body,
  });

  final XNavigationBarItems currentItem;
  final Widget body;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(widget.currentItem),
      child: BlocBuilder<DashboardBloc, XNavigationBarItems>(
        builder: (context, state) {
          // Fix: Change XNavigationBarItems to DashboardState
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              context.read<DashboardBloc>().goHome();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      Assets.svgs.pattern,
                    ),
                  ),
                  widget.body,
                ],
              ),
              bottomNavigationBar: const Padding(
                padding: EdgeInsets.all(20.0),
                child: XBottomNavigationBar(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
