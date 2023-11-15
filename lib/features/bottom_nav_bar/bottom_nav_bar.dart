// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:morethantwo/features/presentation/bottom_nav_bar/cubit.dart';
//
// class BottomNavBar extends StatelessWidget {
//   static const String path = "home";
//
//   const BottomNavBar({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: BlocBuilder<BottomNavBarCubit, int>(
//         builder: (context, state) => Material(
//           child: Column(
//             children: [
//               Expanded(
//                   child: IndexedStack(
//                     index: state,
//                     children: [
//                       BlocProvider<HomeCubit>(
//                         create: (context) => getIt.call<HomeCubit>(),
//                         child: const HomeScreen(),
//                       ),
//                       BlocProvider<HistoryCubit>(
//                         create: (context) => getIt(),
//                         child: const HistoryScreen(),
//                       ),
//                       BlocProvider<FeedbackCubit>(
//                         create: (context) => getIt(),
//                         child: const ContactsScreen(),
//                       )
//                     ],
//                   )),
//               HomeBottomMenu(
//                 onItemSelected: context.read<HomeBottomNavigationCubit>().setIndex,
//                 selectedIndex: state,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }