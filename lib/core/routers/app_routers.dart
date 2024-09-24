import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoku_app/core/routers/routers.dart';
import 'package:valoku_app/features/agent/presentation/pages/pages.dart';

List<GoRoute> _registerRoutes() {
  return [
    GoRoute(
      name: RouterConstans.agentPage,
      path: RouterConstans.agentPage,
      builder: (BuildContext context, GoRouterState state) {
        return const AgentPage();
      },
    ),
    GoRoute(
      name: RouterConstans.agentDetailPage,
      path: RouterConstans.agentDetailPage,
      builder: (BuildContext context, GoRouterState state) {
        return const DetailAgentPage();
      },
    ),
  ];
}

final GoRouter appRouter = GoRouter(
  routes: _registerRoutes(),
  initialLocation: RouterConstans.agentPage,
);
