// Created by Adipt on 29/01/2022

part of '../view.dart';

class HomeTemperature extends ConsumerWidget {
  const HomeTemperature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final stateController = ref.watch(_stateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Home Temperature',
            style: TextStyle(
              color: (state.homeTemp) ? QColor.blackColor : Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: (state.homeTemp) ? QColor.blackColor : Colors.white,
              ),
              children: const [
                TextSpan(
                  text: '23',
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
                ),
                TextSpan(
                  text: '°C',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          QSwitcher(
            value: state.homeTemp,
            onChanged: stateController.onHomeSwitchChanged,
          ),
        ],
      ),
    );
  }
}
