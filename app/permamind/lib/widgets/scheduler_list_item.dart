

import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:permamind/blocs/blocs.dart';


class ScheduleListItem extends StatefulWidget {

  final Activity activity;
  final String userId;

  ScheduleListItem({
    @required this.activity,
    @required this.userId,
    Key key}) : super(key: key);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {

  bool checkboxValue;

  @override
  Widget build(BuildContext context) {

    checkboxValue = widget.activity.complete;

    return CustomListItemTwo(
      thumbnail: Container(
        decoration: const BoxDecoration(color: Colors.pink),
      ),
      title: 'Flutter 1.0 Launch',
      subtitle:
      'Flutter continues to improve and expand its horizons.'
          'This text should max out at two lines and clip',
      author: 'Dash',
      publishDate: 'Dec 28',
      readDuration: '5 mins',
    );

    return ListTile(
      leading: checkboxValue == true ? Container(
        height: 50,
        width: 50,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FlutterReactionButton(
            onReactionChanged: (reaction, selectedIndex) {
              BlocProvider.of<ActivitiesBloc>(context).add(
                  ActivityUpdated(
                    widget.activity.copyWith(
                        id: widget.activity.id,
                        parcelId: widget.activity.parcelId,
                        title: widget.activity.title,
                        complete: widget.activity.complete,
                        expectedDate: widget.activity.expectedDate,
                        category : widget.activity.category,
                        completeActivityUserId : widget.activity.completeActivityUserId,
                        feedback: selectedIndex
                    ),
                  )
              );
            },
            reactions: activitiesFeedback,
            initialReaction: widget.activity.feedback == null ? defaultInitialReaction : activitiesFeedback[widget.activity.feedback],
            color: Colors.black.withOpacity(0.5),
            radius: 10,
          ),
        )
      ) : Container(height: 50, width: 50),
      subtitle: Text(
          '${widget.activity.title}'
      ),
      trailing: Checkbox(
          value: checkboxValue,
          activeColor: Colors.green,
          onChanged:(bool newValue){
            setState(() {
              checkboxValue = newValue;
              BlocProvider.of<ActivitiesBloc>(context).add(
                  ActivityUpdated(
                    widget.activity.copyWith(
                        id: widget.activity.id,
                        parcelId: widget.activity.parcelId,
                        title: widget.activity.title,
                        complete: checkboxValue,
                        expectedDate: widget.activity.expectedDate,
                        category : widget.activity.category,
                        completeActivityUserId : widget.activity.completeActivityUserId.isEmpty ? widget.userId : widget.activity.completeActivityUserId,
                        feedback: null
                    ),
                  )
              );
            });
          }),
      isThreeLine: true,
    );

  }

}



final defaultInitialReaction = Reaction(
  previewIcon: _buildPreviewIconFeedback('assets/user_reactions/react.png'),
  icon: _buildIcon('assets/user_reactions/react.png',),
);

final activitiesFeedback = [
  Reaction(
    previewIcon: _buildPreviewIconFeedback('assets/user_reactions/dislike.png'),
    icon: _buildIcon('assets/user_reactions/dislike.png',),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFeedback('assets/user_reactions/confused.png'),
    icon: _buildIcon('assets/user_reactions/confused.png',),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFeedback('assets/user_reactions/like.png'),
    icon: _buildIcon('assets/user_reactions/like.png'),
  ),
];



class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate · $readDuration ★',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  CustomListItemTwo({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}















Widget _buildPreviewIconFeedback(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
    child: Image.asset(path, height: 40),
  );
}

Widget _buildIcon(String path) {
  return Image.asset(
    path,
    height: 20,
    width: 20,
  );
}