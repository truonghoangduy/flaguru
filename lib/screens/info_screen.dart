import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaguru/models/Authenticator.dart';
import 'package:flaguru/models/User.dart';
import 'package:flaguru/screens/menu_screen.dart';
import 'package:flaguru/widgets/background_info.dart';
import 'package:flaguru/widgets/button_switch_info.dart';
import 'package:flaguru/widgets/info_user.dart';
import 'package:flaguru/widgets/progress_user.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = "/info_screen";
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  //pro
  var auth = Authentication();
  User _currentUser;
  //ctor
  _InfoScreenState() {
    this.auth.getCurrentUser().then((user) {
      setState(() {
        this._currentUser = user;
        this._currentUser.email =
            user.email[0].toUpperCase() + user.email.substring(1);
      });
    });
  }
  //meth
  void signout(BuildContext context) {
    // Navigator.pushNamed(context, MenuScreen.routeName);
    // Navigator.pop(context);
    this.auth.signOut().then((_) {}).catchError((err) => print(err));
    Navigator.popAndPushNamed(context, MenuScreen.routeName);
  }

  void switchuser() {
    this.auth.switchUser().then((_) {
      return this.auth.getCurrentUser();
    }).then((user) {
      setState(() {
        this._currentUser = user;
      });
    }).catchError((err) => print(err));
    print(this._currentUser);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    print(_height);
    print(_width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: _height * 0.232,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      BackgroundInfo(),
                      Align(
                        alignment: Alignment(0, 1),
                        child: Container(
                          //margin: EdgeInsets.only(top: 50),
                          height: _height * 0.1709,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  this._currentUser.avatar,
                                  height: _height * 0.12,
                                  width: _height * 0.12,
                                  repeat: ImageRepeat.noRepeat,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                _currentUser.name,
                                style: TextStyle(
                                    fontSize: _height * 0.0273,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                // double paddingvl = _height*0.04;
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  children: <Widget>[
                    //ProgressUser(),
                    // InfoUser(
                    //   name: _currentUser.name,
                    //   email: _currentUser.email,
                    //   score: '100',
                    // ),
                    getTotalScore(),
                    SizedBox(height: _height * 0.0273),
                    getScroreUserCard('Easy', '100', '100', '100', _height),
                    SizedBox(height: _height * 0.02),
                    getScroreUserCard('Medium', '200', '200', '200', _height),
                    SizedBox(height: _height * 0.02),
                    getScroreUserCard('Hard', '300', '300', '300', _height),
                    SizedBox(height: _height * 0.02),
                    getScroreUserCard('Enless', '400', '400', '400', _height),
                    ButtonSwitchButtonLogout(
                        signout: signout,
                        switchuser: switchuser,
                        paramcontext: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTotalScore ()
  {
    return Container(
      child: Row(children: <Widget>[
        Text('Total Score: ',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        ),
        Text('769',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700
        ),)
      ],) ,
    );
  }
  Widget getScoreSmall(String rounds, double _height) {
    return (Container(
      height: _height * 0.1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: _height * 0.005),
            child: Container(
              child: Text(
                rounds,
                style: TextStyle(
                    fontSize: _height * 0.039, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 8.8,
          ),
          Text(
            'rounds',
            style: TextStyle(
                fontSize: _height * 0.025, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ));
  }

  Widget getScoreHight(String score, _height) {
    return (Container(
      child: Column(
        children: <Widget>[
          Text(
            score,
            style: TextStyle(
                fontSize: _height * 0.047, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'High Score',
            style: TextStyle(
                fontSize: _height * 0.03, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ));
  }

  Widget getScroreUserCard(String diff, String rounds, String highestScore,
      String wins, double _height) {
    return (Container(
      height: _height * 0.205,
      width: double.infinity,
      decoration: BoxDecoration(
          //color: Color.fromRGBO(34, 182, 192, 1),
          color: Colors.white,
          border: Border.all(
            color: Color.fromRGBO(217, 217, 217, 1),
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(217, 217, 217, 1),
              blurRadius: 3.0,
              offset: Offset(0, 0),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //name
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 6),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              diff,
              style: TextStyle(
                  fontSize: _height * 0.038, fontWeight: FontWeight.w700),
            ),
          ),
          //Text('EASY'),
          // score
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              getScoreSmall(rounds, _height),
              SizedBox(
                width: _height * 0.0068,
              ),
              getScoreHight(highestScore, _height),
              SizedBox(
                width: _height * 0.0068,
              ),
              getScoreSmall(rounds, _height),
            ],
          )
        ],
      ),
    ));
  }
}
