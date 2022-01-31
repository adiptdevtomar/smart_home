// Created by Adipt on 29/01/2022

part of '../view.dart';

class MusicCard extends ConsumerWidget {
  const MusicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final stateController = ref.watch(_stateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  height: 35.0,
                  width: 35.0,
                  child: (state.image?.path != null)
                      ? Image.asset(state.image!.path)
                      : const Icon(Icons.music_note),
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.title,
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    Text(
                      state.artist,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 11.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: stateController.onPreviousPressed,
                child: const Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              GestureDetector(
                onTap: stateController.onPlayPausePressed,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(21.0),
                  ),
                  child: StreamBuilder(
                    stream: stateController.assetsAudioPlayer.isPlaying,
                    builder: (context, asyncSnapshot) {
                      final isPlaying = asyncSnapshot.data;
                      return Icon(
                        (isPlaying == true) ? Icons.pause : Icons.play_arrow,
                        size: 30.0,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: stateController.onNextPressed,
                child: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
