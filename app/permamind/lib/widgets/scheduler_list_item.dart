import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:permamind/blocs/blocs.dart';

class ScheduleListItem extends StatefulWidget {
  final Activity activity;
  final String userId;

  ScheduleListItem({@required this.activity, @required this.userId, Key key})
      : super(key: key);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  bool checkboxValue;

  @override
  Widget build(BuildContext context) {
    checkboxValue = widget.activity.complete;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Checkbox(
                value: checkboxValue,
                onChanged: (bool value) {
                  setState((){
                    checkboxValue = value;
                    // TODO Add user for completeActivityUser
                    BlocProvider.of<ActivitiesBloc>(context).add(
                        ActivityUpdated(
                          widget.activity.copyWith(
                              id: widget.activity.id,
                              parcelId: widget.activity.parcelId,
                              title: widget.activity.title,
                              complete: checkboxValue,
                              expectedDate: widget.activity.expectedDate,
                              category : widget.activity.category,
                              completeActivityUserId : widget.activity.completeActivityUserId
                          ),
                        )
                    );
                  });
                },
              )),
          Expanded(
            flex: 7,
            child: _ArticleDescription(
              content: widget.activity
            ),
          ),
//          Expanded(
//            flex: 1,
//            child: Container(height: 20, color: Colors.red,)
//          ),
        ],
      ),
    );

    return ListTile(
      leading: checkboxValue == true
          ? Container(
              height: 50,
              width: 50,
              child: Padding(
                padding: EdgeInsets.all(10),
//          child: FlutterReactionButton(
//            onReactionChanged: (reaction, selectedIndex) {
//              BlocProvider.of<ActivitiesBloc>(context).add(
//                  ActivityUpdated(
//                    widget.activity.copyWith(
//                        id: widget.activity.id,
//                        parcelId: widget.activity.parcelId,
//                        title: widget.activity.title,
//                        complete: widget.activity.complete,
//                        expectedDate: widget.activity.expectedDate,
//                        category : widget.activity.category,
//                        completeActivityUserId : widget.activity.completeActivityUserId,
//                        feedback: selectedIndex
//                    ),
//                  )
//              );
//            },
//            reactions: activitiesFeedback,
//            initialReaction: widget.activity.feedback == null ? defaultInitialReaction : activitiesFeedback[widget.activity.feedback],
//            color: Colors.black.withOpacity(0.5),
//            radius: 10,
//          ),
              ))
          : Container(height: 50, width: 50),
      subtitle: Text('${widget.activity.title}'),
      trailing: Checkbox(
          value: checkboxValue,
          activeColor: Colors.green,
          onChanged: (bool newValue) {
            setState(() {
              checkboxValue = newValue;
              BlocProvider.of<ActivitiesBloc>(context).add(ActivityUpdated(
                widget.activity.copyWith(
                    id: widget.activity.id,
                    parcelId: widget.activity.parcelId,
                    title: widget.activity.title,
                    complete: checkboxValue,
                    expectedDate: widget.activity.expectedDate,
                    category: widget.activity.category,
                    completeActivityUserId:
                        widget.activity.completeActivityUserId.isEmpty
                            ? widget.userId
                            : widget.activity.completeActivityUserId,
                    feedback: null),
              ));
            });
          }),
      isThreeLine: true,
    );
  }
}


class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.content,
  }) : super(key: key);

  final Activity content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 2.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${content.title}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 0.0, 10.0, 0.0),
                  child: FlutterReactionButtonCheck(
                    onReactionChanged: (reaction, selectedIndex, isChecked) {
                      BlocProvider.of<ActivitiesBloc>(context).add(
                          ActivityUpdated(
                            content.copyWith(
                                id: content.id,
                                parcelId: content.parcelId,
                                title: content.title,
                                complete: content.complete,
                                expectedDate: content.expectedDate,
                                category : content.category,
                                completeActivityUserId : content.completeActivityUserId,
                                feedback: selectedIndex
                            ),
                          )
                      );

                    },
                    reactions: facebookReactions,
                    initialReaction: defaultInitialReaction,
                    selectedReaction: facebookReactions[0],
                  )),
            ],
          )
        ],
      ),
    );

//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Expanded(
//          flex: 3,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                '$subtitle',
//                maxLines: 3,
//                overflow: TextOverflow.ellipsis,
//                style: const TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 15
//                ),
//              ),
//            ],
//          ),
//        ),
//        Expanded(
//          flex: 2,
//          child: Container(
////            color: Colors.yellow,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                FlutterReactionButton(
//                  onReactionChanged: (reaction, selectedIndex) {
////                    BlocProvider.of<ActivitiesBloc>(context).add(
////                        ActivityUpdated(
////                          widget.activity.copyWith(
////                              id: widget.activity.id,
////                              parcelId: widget.activity.parcelId,
////                              title: widget.activity.title,
////                              complete: widget.activity.complete,
////                              expectedDate: widget.activity.expectedDate,
////                              category : widget.activity.category,
////                              completeActivityUserId : widget.activity.completeActivityUserId,
////                              feedback: selectedIndex
////                          ),
////                        )
////                    );
//                  },
//                  reactions: activitiesFeedback,
//                  initialReaction: activitiesFeedback[0],
////                  widget.activity.feedback == null ? defaultInitialReaction : activitiesFeedback[widget.activity.feedback],
//                  color: Colors.black.withOpacity(0.5),
//                  radius: 10,
//                ),
//              ],
//            ),
//          ),)
////        Expanded(
////          flex: 1,
////          child: Column(
////            crossAxisAlignment: CrossAxisAlignment.start,
////            mainAxisAlignment: MainAxisAlignment.end,
////            children: <Widget>[
////              Text(
////                '$author',
////                style: const TextStyle(
////                  fontSize: 12.0,
////                  color: Colors.black87,
////                ),
////              ),
////              Text(
////                '$publishDate · $readDuration ★',
////                style: const TextStyle(
////                  fontSize: 12.0,
////                  color: Colors.black54,
////                ),
////              ),
////            ],
////          ),
////        ),
//      ],
//    );
  }
}

//class CustomListItemTwo extends StatelessWidget {
//  CustomListItemTwo({
//    Key key,
//    this.content
//  }) : super(key: key);
//
//  final String content;
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}

final defaultInitialReaction = Reaction(
  previewIcon: _buildPreviewIconFacebook('assets/user_reactions/like.png'),
  icon: _buildIconFacebook('assets/user_reactions/like.png',
      Text('Like', style: TextStyle(color: Colors.grey[600]))),
);

final facebookReactions = [
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/user_reactions/like.gif'),
    icon: _buildIconFacebook('assets/user_reactions/like_fill.png',
        Text('Like', style: TextStyle(color: Color(0XFF3b5998)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/user_reactions/love.gif'),
    icon: _buildIconFacebook('assets/user_reactions/love.png',
        Text('Love', style: TextStyle(color: Color(0XFFed5168)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/user_reactions/wow.gif'),
    icon: _buildIconFacebook('assets/user_reactions/wow.png',
        Text('Wow', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/user_reactions/haha.gif'),
    icon: _buildIconFacebook('assets/user_reactions/haha.png',
        Text('Haha', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/user_reactions/sad.gif'),
    icon: _buildIconFacebook('assets/user_reactions/sad.png',
        Text('Sad', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
      previewIcon: _buildPreviewIconFacebook('assets/user_reactions/angry.gif'),
      icon: _buildIconFacebook('assets/user_reactions/angry.png',
          Text('Angry', style: TextStyle(color: Color(0XFFf05766))))),
];


Widget _buildPreviewIconFacebook(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
    child: Image.asset(path, height: 40),
  );
}

Widget _buildIconFacebook(String path, Text text) {
  return Container(
    color: Colors.transparent,
    child: Row(
      children: <Widget>[
        Image.asset(path, height: 20),
        SizedBox(
          width: 5,
        ),
        text,
      ],
    ),
  );
}
