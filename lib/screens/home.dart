import 'package:flutter/material.dart';
import 'package:qms/screens/report_incident.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _home() {}
  _email() {}
  _openTask() {}
  _dashboard() {}

  _reportIncident() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ReportIncident()));
  }

  _auditCheckPoint() {}
  _fsmProcess() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          color: Colors.blue[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Image.asset('assets/icon/home/Path_2.jpg'),
                            onPressed: () => _email()),
                        IconButton(
                            icon: Image.asset(
                                'assets/icon/home/Icon-ionic-ios-mail.jpg'),
                            onPressed: () => _openTask()),
                        IconButton(
                            icon: Image.asset(
                                'assets/icon/home/Icon-open-task.jpg'),
                            onPressed: () => _dashboard()),
                        IconButton(
                            icon: Image.asset(
                                'assets/icon/home/Icon-material-dashboard.jpg'),
                            onPressed: () => _home()),
                      ])),
              SizedBox(
                height: 200,
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                      child: Text('Report Incident',
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onTap: () => _reportIncident(),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                      child: Text('Audit Checklist',
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onTap: () => _auditCheckPoint(),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                      child: Text('FSM Process',
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onTap: () => _fsmProcess(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
