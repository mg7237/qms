import 'package:flutter/material.dart';
import 'package:qms/widgets/label_text.dart';
import 'package:qms/util/utility.dart';
import 'package:qms/widgets/ensure_visible.dart';

class ReportIncident extends StatefulWidget {
  @override
  _ReportIncidentState createState() => _ReportIncidentState();
}

const List<String> aircraftRegList = [
  'Select Aircraft Reg',
  'Aircraft Reg Choice - A',
  'Aircraft Reg Choice - B',
  'Aircraft Reg Choice - C',
  'Aircraft Reg - D'
];
const List<String> incidentTypeList = [
  'Safety Incident',
  'Incident Choice - A',
  'Incident Choice - B',
  'Incident Choice - C',
  'Incident Choice - D'
];
const List<String> weatherInformationList = [
  'Weather',
  'Weather Choice - A',
  'Weather Choice - B',
  'Weather Choice - C',
  'Weather Choice - D'
];

class _ReportIncidentState extends State<ReportIncident> {
  String _selectedAircraftReg = 'Select Aircraft Reg';
  String _selectedIncidentType = 'Safety Incident';
  String _selectedWeather = 'Weather';

  FocusNode _focusNodeTitle = FocusNode();
  FocusNode _focusNodeDescription = FocusNode();
  FocusNode _focusNodeAircraftReg = FocusNode();
  FocusNode _focusNodeIncidentType = FocusNode();
  FocusNode _focusNodeWeatherInfo = FocusNode();

  static final TextEditingController _titleController = TextEditingController();
  static final TextEditingController _descriptionController =
      TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _yes() {}

  _no() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue[800],
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Container(
                    width: double.infinity,
                    child: Text(
                      'Report Incident',
                      textAlign: TextAlign.center,
                    )),
                bottom: TabBar(tabs: [
                  Tab(
                    child: Text('Start',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Tab(
                    child: Text('Step 2',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Tab(
                    child: Text('Step 3',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Tab(
                    child: Text('Stop',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ])),
            body: Container(
              color: Colors.blue[50],
              child: TabBarView(children: [
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          LabelText("Enter Title"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: EnsureVisibleWhenFocused(
                              focusNode: _focusNodeTitle,
                              child: new TextFormField(
                                //enabled: !showLoader,
                                style: TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(style: BorderStyle.none),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    hintText: 'Title',
                                    fillColor: Colors.white),
                                // onSaved: (value) =>
                                //     _loginRequestModel.email = value,
                                //validator: _loginRequestModel.emailValidate,
                                validator: (value) {
                                  if ((value ?? '') != '') {
                                    return null;
                                  } else
                                    return 'Enter Title';
                                },
                                controller: _titleController,
                                focusNode: _focusNodeTitle,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (value) {
                                  fieldFocusChange(context, _focusNodeTitle,
                                      _focusNodeAircraftReg);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Select Aircraft Reg:"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              padding: EdgeInsets.symmetric(horizontal: 23),
                              child: DropdownButton(
                                underline: SizedBox(),
                                focusNode: _focusNodeAircraftReg,
                                value: _selectedAircraftReg,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedAircraftReg = newValue;
                                  });
                                },
                                items:
                                    aircraftRegList.map((aircraftRegOptions) {
                                  return DropdownMenuItem(
                                    child: new Text(aircraftRegOptions,
                                        style: TextStyle(fontSize: 16)),
                                    value: aircraftRegOptions,
                                  );
                                }).toList(),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Select Incident Type"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              padding: EdgeInsets.symmetric(horizontal: 23),
                              child: DropdownButton(
                                underline: SizedBox(),
                                focusNode: _focusNodeIncidentType,
                                value: _selectedIncidentType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedIncidentType = newValue;
                                  });
                                },
                                items: incidentTypeList.map((incidentType) {
                                  return DropdownMenuItem(
                                    child: new Text(incidentType,
                                        style: TextStyle(fontSize: 16)),
                                    value: incidentType,
                                  );
                                }).toList(),
                              )),

                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Weather Information"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              padding: EdgeInsets.symmetric(horizontal: 23),
                              child: DropdownButton(
                                underline: SizedBox(),
                                focusNode: _focusNodeWeatherInfo,
                                value: _selectedWeather,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedWeather = newValue;
                                  });
                                },
                                items: weatherInformationList
                                    .map((weatherInformation) {
                                  return DropdownMenuItem(
                                    child: new Text(weatherInformation,
                                        style: TextStyle(fontSize: 16)),
                                    value: weatherInformation,
                                  );
                                }).toList(),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Weather Information"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    onTap: () => _yes(),
                                  )),
                              SizedBox(width: 20),
                              Container(
                                  height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => _no(),
                                  )),
                            ],
                          ),

                          // DropDownView(
                          //   text: stateName != null || stateName.isNotEmpty ? stateName : "Select",
                          //   onPressed: () {
                          //     _showStatePicker();
                          //   },
                          // ),
                        ])),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText("Enter Detailed Description"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: EnsureVisibleWhenFocused(
                              focusNode: _focusNodeTitle,
                              child: new TextFormField(
                                //enabled: !showLoader,
                                style: TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(style: BorderStyle.none),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    hintText:
                                        'Description net less than 100 words',
                                    fillColor: Colors.white),
                                // onSaved: (value) =>
                                //     _loginRequestModel.email = value,
                                //validator: _loginRequestModel.emailValidate,
                                validator: (value) {
                                  if ((value ?? '') != '') {
                                    if (value.length >= 100) {
                                      // 100 words noy char
                                      return null;
                                    } else {
                                      return 'Please enter minimum 100 words';
                                    }
                                  } else
                                    return 'Enter Description';
                                },
                                controller: _descriptionController,
                                focusNode: _focusNodeDescription,
                                keyboardType: TextInputType.multiline,
                                minLines:
                                    1, //Normal textInputField will be displayed
                                maxLines: 5,
                                textInputAction: TextInputAction.next,
                                // onFieldSubmitted: (value) {
                                //   fieldFocusChange(context, _focusNodeDescription,
                                //       _focusNodeAircraftReg);
                                // },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Engine Failure"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    onTap: () => _yes(),
                                  )),
                              SizedBox(width: 20),
                              Container(
                                  height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => _no(),
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          LabelText("TCAS RA"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    onTap: () => _yes(),
                                  )),
                              SizedBox(width: 20),
                              Container(
                                  height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => _no(),
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          LabelText("Bird Strike"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    onTap: () => _yes(),
                                  )),
                              SizedBox(width: 20),
                              Container(
                                  height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => _no(),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          LabelText("Go - Around"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    onTap: () => _yes(),
                                  )),
                              SizedBox(width: 20),
                              Container(
                                  height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: InkWell(
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => _no(),
                                  )),
                            ],
                          ),

                          // DropDownView(
                          //   text: stateName != null || stateName.isNotEmpty ? stateName : "Select",
                          //   onPressed: () {
                          //     _showStatePicker();
                          //   },
                          // ),
                        ])),
                Container(),
                Container(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
