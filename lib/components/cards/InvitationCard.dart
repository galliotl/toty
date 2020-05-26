import 'package:flutter/material.dart';
import 'package:toty/viewModels/uiModels/InviteUIModel.dart';

class InvitationCard extends StatelessWidget {
  final String pathToImage;
  final String header;
  final String content;

  InvitationCard({
    @required this.pathToImage,
    @required this.content,
    @required this.header,
  });

  factory InvitationCard.fromUIModel(InviteUIModel uiModel) {
    return InvitationCard(
      header: uiModel.playerName,
      content: '${uiModel.matchDateTime.day} ${uiModel.matchDateTime.dayNumber} ${uiModel.matchDateTime.month} - ${uiModel.matchDateTime.hour}:${uiModel.matchDateTime.minute}',
      pathToImage: uiModel.playerAvatarUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20),
        ],
        border: Border.all(color: Theme.of(context).accentColor, width: 3),
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.network(this.pathToImage),
            ),
            Column(
              children: [
                Text(this.header),
                Text(this.content),
              ],
            ),
            Icon(Icons.delete, color: Theme.of(context).errorColor),
            Icon(Icons.done, color: Theme.of(context).highlightColor)
          ],
        ),
      ),
    );
  }
}
