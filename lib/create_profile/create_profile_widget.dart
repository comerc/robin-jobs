import '../add_work_exp/add_work_exp_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../company_profile/company_profile_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page_o_l_d/home_page_o_l_d_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({Key key}) : super(key: key);

  @override
  _CreateProfileWidgetState createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  double salaryRangeValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          'Create Profile',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.subtitle1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 48,
                        icon: Icon(
                          Icons.photo_camera_outlined,
                          color: FlutterFlowTheme.grayIcon400,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: FlutterFlowTheme.title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.darkText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: FlutterFlowTheme.lineColor,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Postition Title',
                          labelStyle: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayIcon400,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.lineColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.lineColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.darkText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Short Description',
                            labelStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.darkText,
                          ),
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: FlutterFlowTheme.lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: FlutterFlowDropDown(
                        initialOption: dropDownValue ??= 'Experience Level',
                        options: [
                          '< 6 Months',
                          '6m - 1y',
                          '1y - 3y',
                          '+3 years',
                          '+5 years',
                          '+8 years'
                        ].toList(),
                        onChanged: (val) => setState(() => dropDownValue = val),
                        width: 130,
                        height: 40,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.grayIcon,
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: FlutterFlowTheme.grayIcon400,
                          size: 16,
                        ),
                        fillColor: Colors.white,
                        elevation: 0,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                        hidesUnderline: true,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: FlutterFlowTheme.lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: TextFormField(
                          controller: textController4,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Company',
                            labelStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.darkText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: FlutterFlowTheme.lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Salary',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$40,000',
                      style: FlutterFlowTheme.bodyText2,
                    ),
                    Text(
                      '\$150,000+',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Slider(
                  activeColor: FlutterFlowTheme.secondaryColor,
                  inactiveColor: Color(0xFF9E9E9E),
                  min: 40000,
                  max: 160000,
                  value: salaryRangeValue ??= 100000,
                  label: salaryRangeValue.toString(),
                  divisions: 24,
                  onChanged: (newValue) {
                    setState(() => salaryRangeValue = newValue);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue as a(n)',
                      style: FlutterFlowTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose an option below to continue.',
                      style: FlutterFlowTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final usersUpdateData = createUsersRecordData(
                        displayName: textController1.text,
                        positionTitle: textController2.text,
                        bio: textController3.text,
                        experienceLevel: dropDownValue,
                        currentCompany: textController4.text,
                        salary: salaryRangeValue.toString(),
                      );
                      await currentUserReference.update(usersUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddWorkExpWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.lineColor,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Icon(
                              Icons.person_outline,
                              color: FlutterFlowTheme.grayIcon,
                              size: 44,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'As an Individual',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayIcon,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: FlutterFlowTheme.grayIcon400,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final usersUpdateData = createUsersRecordData(
                          displayName: textController1.text,
                          positionTitle: textController2.text,
                          bio: textController3.text,
                          experienceLevel: dropDownValue,
                          currentCompany: textController4.text,
                          salary: salaryRangeValue.toString(),
                        );
                        await currentUserReference.update(usersUpdateData);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyProfileWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.tertiaryColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: FlutterFlowTheme.lineColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Icon(
                                Icons.group_outlined,
                                color: FlutterFlowTheme.grayIcon,
                                size: 44,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'As a Company',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.grayIcon,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: FlutterFlowTheme.grayIcon400,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePageOLDWidget(),
                              ),
                            );
                          },
                          text: 'Skip for Now',
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color: FlutterFlowTheme.background,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayIcon400,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
