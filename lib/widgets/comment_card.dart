import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({Key? key, this.snap}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
           CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              widget.snap['profilePic'].toString()
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:widget.snap['username'],
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "  ${widget.snap['text']}",
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child:const Icon(Icons.favorite,size: 16,) ,
          )
        ],
      ),
    );
  }
}
