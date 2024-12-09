import 'package:flutter/material.dart';
import 'package:valoku_app/features/agent/presentation/blocs/get_agent/get_agent_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgentPage extends StatelessWidget {
  final GetAgentBloc getAgentBloc;

  const AgentPage({
    super.key,
    required this.getAgentBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getAgentBloc,
        ),
      ],
      child: const AgentPageContent(),
    );
  }
}

class AgentPageContent extends StatefulWidget {
  const AgentPageContent({super.key});

  @override
  State<AgentPageContent> createState() => _AgentPageContentState();
}

class _AgentPageContentState extends State<AgentPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<GetAgentBloc>().add(
          const GetAgentEvent.fetch(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent'),
      ),
      body: BlocBuilder<GetAgentBloc, GetAgentState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status.isLoaded) {
            if (state.error != null) {
              return Center(child: Text(state.error.toString()));
            }
            return Center(child: Text(state.data?.displayName ?? '-'));
          }
          return Container();
          // return ElevatedButton(
          //   onPressed: () {
          //     GoRouter.of(context).pushNamed(
          //       RouterConstans.agentDetailPage,
          //     );
          //   },
          //   child: const Text('To detail'),
          // );
        },
      ),
    );
  }
}
