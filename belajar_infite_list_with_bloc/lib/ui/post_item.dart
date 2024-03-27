import 'package:belajar_infite_list_with_bloc/model/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post);
  @override
  Widget build(BuildContext context) {
    print(post.body);
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(post.id),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(post.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
