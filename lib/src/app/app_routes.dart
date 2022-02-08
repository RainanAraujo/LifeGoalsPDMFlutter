import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/pages/goal_viewer_page.dart';
import 'package:life_goals_pdm/src/pages/goals_types_page.dart';
import 'package:life_goals_pdm/src/pages/login_page.dart';
import 'package:life_goals_pdm/src/pages/manage_goal_page.dart';
import 'package:life_goals_pdm/src/pages/navigation_bottom_bar.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const LoginPage(),
  '/navigationBottomBar': (context) => const NavigationBottomBar(),
  '/goalsTypes': (context) => const GoalsTypes(),
  '/goalViewer': (context) => const GoalViewer(),
  '/manageGoal': (context) => const ManageGoal(),
};
