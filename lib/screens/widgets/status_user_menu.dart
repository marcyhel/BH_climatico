import 'package:flutter/material.dart';

class State_user extends StatelessWidget {
  const State_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Flexible(
                child: Text(
                  "Marcyhel menezes",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Text(
            "Status: Online",
            style: TextStyle(fontSize: 13, color: Colors.white),
          )
        ],
      ),
    );
  }
}
