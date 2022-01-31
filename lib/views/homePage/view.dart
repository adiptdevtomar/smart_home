// Created by Adipt on 29/01/2022

import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_home/constants/colors/colors.dart';
import 'package:smart_home/views/shared_widgets/card.dart';
import 'package:smart_home/views/shared_widgets/constrained_card.dart';
import 'package:smart_home/views/shared_widgets/switcher.dart';

part 'controller.dart';

part 'widgets/home_temperature.dart';

part 'widgets/header.dart';

part 'widgets/plug_wall.dart';

part 'widgets/list_item.dart';

part 'widgets/music_card.dart';

part 'widgets/smart_tv.dart';

part 'widgets/electricity_block.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final stateController = ref.watch(_stateProvider.notifier);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: const AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Header(),
                SizedBox(
                  height: size.height * 0.07,
                ),
                const Text(
                  'Living Room',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                SizedBox(
                  height: 245.0,
                  child: Row(
                    children: [
                      QCard(
                        child: const HomeTemperature(),
                        isEnabled: state.homeTemp,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      QCard(
                        child: const PlugWall(),
                        isEnabled: state.plugWall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: 145.0,
                  child: Row(
                    children: [
                      const QCard(
                        child: MusicCard(),
                        isEnabled: false,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      QCard(
                        child: const SmartTv(),
                        isEnabled: state.smartTv,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Statistics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Month',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                const QConstrainedCard(
                  height: 200.0,
                  width: double.infinity,
                  child: ElectricityBlock(),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
