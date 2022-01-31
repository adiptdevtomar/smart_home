// Created by Adipt on 29/01/2022

part of 'view.dart';

final _stateProvider =
    StateNotifierProvider.autoDispose<_StateController, _State>((ref) {
  final stateController = _StateController();
  stateController.playMedia();
  stateController.assembleWidget();

  return stateController;
});

class _State {
  final bool homeTemp;
  final bool plugWall;
  final bool smartTv;
  final String title;
  final String artist;
  final List<Widget> electricityStats;
  final MetasImage? image;

  _State({
    required this.homeTemp,
    required this.plugWall,
    required this.smartTv,
    required this.title,
    required this.artist,
    required this.image,
    required this.electricityStats,
  });

  _State.initial()
      : this(
          homeTemp: false,
          plugWall: false,
          smartTv: false,
          artist: '',
          title: '',
          image: null,
          electricityStats: [],
        );

  _State copyWith({
    bool? homeTemp,
    bool? plugWall,
    bool? smartTv,
    String? artist,
    String? title,
    MetasImage? image,
    List<Widget>? electricityStats,
  }) {
    return _State(
      homeTemp: homeTemp ?? this.homeTemp,
      plugWall: plugWall ?? this.plugWall,
      smartTv: smartTv ?? this.smartTv,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      image: image ?? this.image,
      electricityStats: electricityStats ?? this.electricityStats,
    );
  }
}

class _StateController extends StateNotifier<_State> {
  _StateController() : super(_State.initial());

  final assetsAudioPlayer = AssetsAudioPlayer();
  final random = Random();

  void onHomeSwitchChanged(bool value) {
    state = state.copyWith(
      homeTemp: value,
    );
  }

  void onPlugWallChanged(bool value) {
    state = state.copyWith(
      plugWall: value,
    );
  }

  void onSmartTvChanged(bool value) {
    state = state.copyWith(
      smartTv: value,
    );
  }

  void onAudioChanged() {
    state = state.copyWith(
        title: assetsAudioPlayer.getCurrentAudioTitle,
        artist: assetsAudioPlayer.getCurrentAudioArtist,
        image: assetsAudioPlayer.getCurrentAudioImage);
  }

  void playMedia() async {
    try {
      Audio audio2 = Audio(
        'assets/audio/maBelle.mp3',
        metas: Metas(
          title: 'Ma Belle',
          artist: 'AP Dhillon',
          image: const MetasImage.asset('assets/images/ma_belle.jpg'),
        ),
      );
      Audio audio1 = Audio(
        'assets/audio/prateek.mp3',
        metas: Metas(
          title: 'Tere Hi Hum',
          artist: 'Prateek Kuhad',
          image: const MetasImage.asset('assets/images/prateek.jpg'),
        ),
      );
      await assetsAudioPlayer.open(
        Playlist(
          audios: [
            audio1,
            audio2,
          ],
        ),
        loopMode: LoopMode.playlist,
      );
      onAudioChanged();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Some Error Occurred');
      print(e);
    }
  }

  void onNextPressed() async {
    assetsAudioPlayer.next().whenComplete(() {
      onAudioChanged();
    });
  }

  void onPreviousPressed() async {
    assetsAudioPlayer.previous().whenComplete(() {
      onAudioChanged();
    });
  }

  void onPlayPausePressed() async {
    if (assetsAudioPlayer.isPlaying.value) {
      assetsAudioPlayer.pause();
    } else {
      assetsAudioPlayer.play();
    }
  }

  int getRandomNumber(min, max) {
    return min + random.nextInt(max - min);
  }

  void assembleWidget() {
    List<Widget> electricityStats = [];
    for (int i = 0; i < 20; i++) {
      electricityStats.add(
        Padding(
          padding: EdgeInsets.only(bottom: getRandomNumber(0, 30).toDouble()),
          child: Container(
            height: getRandomNumber(25, 100).toDouble(),
            width: 6.0,
            decoration: BoxDecoration(
              color: (i % 2 == 0) ? Colors.white : const Color(0xff9f948b),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );
    }
    state = state.copyWith(
      electricityStats: electricityStats,
    );
  }
}
