import 'package:flutter/material.dart';
import 'package:toty/viewModels/uiModels/MatchUIModel.dart';

class MatchCard extends StatelessWidget {
  final String date;
  final String time;
  final double distance;
  final int attendees;
  final int maxAttendees;

  MatchCard({
    @required this.date,
    @required this.time,
    @required this.distance,
    @required this.attendees,
    @required this.maxAttendees,
  });

  factory MatchCard.fromUIModel(MatchUIModel uiModel) {
    return MatchCard(
        attendees: uiModel.attendees,
        maxAttendees: uiModel.maxPlayers,
        date:
            '${uiModel.matchDateTime.day} ${uiModel.matchDateTime.dayNumber} ${uiModel.matchDateTime.month}',
        distance: uiModel.distance,
        time: '${uiModel.matchDateTime.hour}:${uiModel.matchDateTime.minute}');
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20),
        ],
      ),
      child: Container(
        color: Theme.of(context).accentColor,
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(this.date),
                Text(this.time),
                Text('${this.distance} km away')
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.group),
                    Text('$attendees / $maxAttendees'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
