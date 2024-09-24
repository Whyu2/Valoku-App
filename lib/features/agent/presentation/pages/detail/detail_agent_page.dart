import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoku_app/core/routers/routers.dart';

class DetailAgentPage extends StatelessWidget {
  const DetailAgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Agent'),
      ),
      body: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(
            RouterConstans.agentPage,
          );
        },
        child: const Text('Back to agent'),
      ),
    );
  }
}
