import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valoku_app/features/agent/presentation/blocs/get_list_agent/get_list_agent_bloc.dart';

class ListAgentPage extends StatelessWidget {
  final GetListAgentBloc getListAgentBloc;

  const ListAgentPage({
    super.key,
    required this.getListAgentBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getListAgentBloc,
        ),
      ],
      child: const ListAgentPageContent(),
    );
  }
}

class ListAgentPageContent extends StatefulWidget {
  const ListAgentPageContent({super.key});

  @override
  State<ListAgentPageContent> createState() => _ListAgentPageContentState();
}

class _ListAgentPageContentState extends State<ListAgentPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<GetListAgentBloc>().add(
          const GetListAgentEvent.fetch(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent'),
      ),
      body: BlocBuilder<GetListAgentBloc, GetListAgentState>(
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
            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height,
              ),
              items: state.data!.map((v) {
                var fullPortrait = v.fullPortrait;
                var background = v.background;
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: v.backgroundGradientColors != null
                            ? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: v.backgroundGradientColors!
                                    .map((color) => Color(int.parse(
                                        '0xff${color.substring(0, 8)}'))) // Konversi hex ke Color
                                    .toList(),
                              )
                            : null,
                        image: background != null
                            ? DecorationImage(
                                image: NetworkImage(background), // Data dari v
                                fit: BoxFit.cover,
                                // Menyesuaikan ukuran gambar
                              )
                            : null, // Jika tidak ada gambar, background tidak ditambahkan
                      ),
                      child: fullPortrait != null
                          ? CachedNetworkImage(
                              imageUrl: fullPortrait,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Lebar layar penuh
                                height: MediaQuery.of(context)
                                    .size
                                    .height, // Tinggi layar penuh
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit
                                        .cover, // Memperbesar gambar agar memenuhi layar penuh
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : null,
                    );
                  },
                );
              }).toList(),
            );
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
