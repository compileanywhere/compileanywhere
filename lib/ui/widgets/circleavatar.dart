import 'package:compileanywhere/ui/models/usermodels.dart';
import 'package:flutter/material.dart';



class CircleAvatarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return CircleAvatar(
                      foregroundColor: Colors.red,

                      //  backgroundColor: Colors.blueAccent,
                      // backgroundImage:NetworkImage(UserDetails().profilepic),
                      backgroundImage: new NetworkImage(UserDetails().profilepic),
                      radius: 22,
                    );
  }
}