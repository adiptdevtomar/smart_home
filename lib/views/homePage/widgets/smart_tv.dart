// Created by Adipt on 29/01/2022

part of '../view.dart';

class SmartTv extends ConsumerWidget {
  const SmartTv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final stateController = ref.watch(_stateProvider.notifier);

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Smart TV',
                style: TextStyle(
                  color: (state.smartTv) ? QColor.blackColor : Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.0,
                color: (state.smartTv) ? QColor.blackColor : Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Samsung UA55 4AC',
            style: TextStyle(
              fontSize: 12.0,
                color: (state.smartTv) ? QColor.blackColor : Colors.white),
          ),
          const Spacer(),
          QSwitcher(
            value: state.smartTv,
            onChanged: stateController.onSmartTvChanged,
          ),
        ],
      ),
    );
  }
}
