import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoku_app/core/routers/routers.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent'),
      ),
      body: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(
            RouterConstans.agentDetailPage,
          );
        },
        child: const Text('To detail'),
      ),
    );
  }
}
