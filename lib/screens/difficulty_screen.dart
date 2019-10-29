import 'package:flaguru/widgets/difficulty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flaguru/screens/play_screen.dart';
import '../models/Enum.dart';


class DifficultyScreen extends StatefulWidget{
  static String routeName = '/difficulty_screen';
  @override
  _DifficultyScreenState createState() => _DifficultyScreenState();

}
class _DifficultyScreenState extends State<DifficultyScreen>{
  
  int timerIconCode =58405;
  int poinIconCode= 57377;
  int infiniteIcon =60221;
  final List arrayofCheckPoint=['0/20','0/30','0/50',];
  @override
  _DifficultyScreenState(
    {
      arrayofCheckPoint,
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 157, 173),
      body: Center(
            //  widthFactor: 300,
            // Center Aligment        // child: Padding(
            //   padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                diffculty_cart("Easy","150",this.arrayofCheckPoint[0],'/playscreen/easy',poinIconCode,timerIconCode),
                diffculty_cart("Normal","120", this.arrayofCheckPoint[1], '/playscreen/normal',poinIconCode,timerIconCode),
                diffculty_cart("Hard","100", this.arrayofCheckPoint[2],'/playscreen/hard',poinIconCode,timerIconCode),
                diffculty_cart("Enless","", "","",infiniteIcon,infiniteIcon),
              ]),
          // ),
        // ),
      ),
    );
  }
}
              // SizedBox(
              //   height: 50,
              // ),
// class DifficultyTitle extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Row(
//         children: <Widget>[
//           Text("0/30",
//             style: TextStyle(
//             fontSize: 30.0
//            ),
//            ),
//           Icon(
//           Icons.games
//           ),
//         ],
//       ),
//     );
//   }

// }
