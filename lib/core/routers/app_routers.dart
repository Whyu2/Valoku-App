import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoku_app/core/config/config.dart';
import 'package:valoku_app/core/routers/routers.dart';
import 'package:valoku_app/features/agent/data/repositories/repositories.dart';
import 'package:valoku_app/features/agent/presentation/blocs/get_agent/get_agent_bloc.dart';
import 'package:valoku_app/features/agent/presentation/blocs/get_list_agent/get_list_agent_bloc.dart';
import 'package:valoku_app/features/agent/presentation/pages/detail_agent/detail_agent_page.dart';
import 'package:valoku_app/features/agent/presentation/pages/list_agent/list_agent_page.dart';

List<GoRoute> _registerRoutes() {
  return [
    GoRoute(
      name: RouterConstans.agentDetail,
      path: RouterConstans.agentDetail,
      builder: (BuildContext context, GoRouterState state) {
        return AgentPage(
          getAgentBloc: GetAgentBloc(
            getIt<AgentRepository>(),
          ),
        );
      },
    ),
    GoRoute(
      name: RouterConstans.agents,
      path: RouterConstans.agents,
      builder: (BuildContext context, GoRouterState state) {
        return ListAgentPage(
          getListAgentBloc: GetListAgentBloc(
            getIt<AgentRepository>(),
          ),
        );
      },
    ),
  ];
}

final GoRouter appRouter = GoRouter(
  routes: _registerRoutes(),
  initialLocation: RouterConstans.agents,
);
