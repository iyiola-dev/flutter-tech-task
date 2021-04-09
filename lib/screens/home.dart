import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/utils/providers.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(homevm);
    String formatteddate = DateFormat("yyyy-MM-dd").format(model.selectedDate);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tap to change the date', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                InkWell(
                  onTap: () {
                    context.read(homevm).getDate(context);
                  },
                  child: Container(
                    height: 80,
                    width: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(11)),
                    child: Center(
                      child: Row(
                        children: [
                          Text(formatteddate),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(CupertinoIcons.down_arrow)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      context
                          .read(homevm)
                          .ops(context, DateTime.parse(formatteddate));
                    },
                    child: Text('Next'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
