// Created by Adipt on 29/01/2022

part of '../view.dart';

class PlugWall extends ConsumerWidget {
  const PlugWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final stateController = ref.watch(_stateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Plug Wall',
                style: TextStyle(
                  color: (state.plugWall) ? QColor.blackColor : Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.0,
                color: (state.plugWall) ? QColor.blackColor : Colors.white,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          ListItem(isEnabled: state.plugWall, title: '  Macbook Pro'),
          ListItem(isEnabled: state.plugWall, title: '  HomePod'),
          ListItem(isEnabled: state.plugWall, title: '  PlayStation 5'),
          const Spacer(
            flex: 2,
          ),
          QSwitcher(
            value: state.plugWall,
            onChanged: stateController.onPlugWallChanged,
          ),
        ],
      ),
    );
  }
}
