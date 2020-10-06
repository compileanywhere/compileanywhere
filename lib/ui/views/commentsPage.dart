import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:compileanywhere/ui/widgets/transparentappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Comments extends StatefulWidget {
  final String programId;
  Comments({Key key, @required this.programId}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState(this.programId);
}

class _CommentsState extends State<Comments> {
  final String programId;
  _CommentsState(this.programId);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _coments;
  Firestore db = Firestore.instance;
  postComment() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print(_coments);

      try {
        Firestore.instance.collection('comments').add({
          'avatar_link': UserDetails().profilepic,
          'creation_date': DateTime.now(),
          'userName': UserDetails().username,
          'comments': _coments,
          'programId': this.programId
        });
        // Navigator.of(context).pop();
      } catch (e) {}
    }
  }

  List<String> _comments = [];
  void _addComment(String val) {
    setState(() {
      _comments.add(val);
      postComment();
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _comments.length) {
          return _buildCommentItem(_comments[index]);
        }
      },
    );
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
  }

  @override
  Widget build(BuildContext context) {

    // db.collection("çomments").document("comments").snapshots().map((event) => {
    //       print('Jahn :::::::::::' + event.documentID),
    //       print('Jahn :::::::::::' + event.data.length.toString())
    //     });

    return BackgroundBox(
      appBar: TransparentAppBar(
        title: 'Comments',
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child:
                  // _buildCommentList(),
                  StreamBuilder(
                stream: db
                    .collection('comments')
                    // .where('userName', isEqualTo: '1@username')
                    .where('programId', isEqualTo: this.programId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data.documents.forEach((doc) => {
                          print('================== ' +
                              doc['comments'] +
                              ' ' +
                              doc['userName'])
                        });
                  }

                  // print(snapshot.data);
                  // print("the data is printed ==============="+ snapshot.data['avatar_link']);
                  // print("the data is printed ==============="+ snapshot.data['userName']);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: CustomCards(
                        title: snapshot.data.documents[index]['comments'],
                        language: snapshot.data.documents[index]['userName'],
                        username: snapshot
                            .data.documents[index]['creation_date']
                            .toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextFormField(
              // onFieldSubmitted:postComment(),
              onFieldSubmitted: (String submittedStr) {
                _addComment(submittedStr);
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  hintText: "Add coments"),
              validator: (input) {
                if (input.isEmpty) {
                  print(input);
                  return 'Provide a coment ';
                }
              },
              onSaved: (input) => _coments = input,
            ),
            RaisedButton(
              child: Text('post'),
// onPressed: postComment(),
            )
          ],
        ),
      ),
    );
  }
}
