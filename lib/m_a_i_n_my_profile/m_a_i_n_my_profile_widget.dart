import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../company_details/company_details_widget.dart';
import '../components/work_exp_bottom_sheet_widget.dart';
import '../components/work_exp_edit_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MAINMyProfileWidget extends StatefulWidget {
  const MAINMyProfileWidget({Key key}) : super(key: key);

  @override
  _MAINMyProfileWidgetState createState() => _MAINMyProfileWidgetState();
}

class _MAINMyProfileWidgetState extends State<MAINMyProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final mAINMyProfileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 570,
                      child: WorkExpBottomSheetWidget(),
                    ),
                  );
                },
              );
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            icon: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.tertiaryColor,
              size: 24,
            ),
            elevation: 8,
            label: Text(
              'Add Job',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 170,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.darkText,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 24, 0),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.dark500,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: FlutterFlowTheme.dark400,
                                                width: 1,
                                              ),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.login_outlined,
                                                color: FlutterFlowTheme
                                                    .grayIcon400,
                                                size: 16,
                                              ),
                                              onPressed: () async {
                                                await signOut();
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 24, 0),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.dark500,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: FlutterFlowTheme.dark400,
                                                width: 1,
                                              ),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfileWidget(
                                                      userProfile:
                                                          mAINMyProfileUsersRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/userAvatar.png',
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: AutoSizeText(
                                                  mAINMyProfileUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme
                                                      .subtitle1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  mAINMyProfileUsersRecord
                                                      .positionTitle,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 12, 0, 8),
                                child: Text(
                                  'Short Description',
                                  style: FlutterFlowTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  child: Text(
                                    mAINMyProfileUsersRecord.bio,
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 12, 0, 8),
                            child: Text(
                              'Experience Level',
                              style: FlutterFlowTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Text(
                                mAINMyProfileUsersRecord.experienceLevel,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 12, 0, 8),
                            child: Text(
                              'Company',
                              style: FlutterFlowTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Text(
                                mAINMyProfileUsersRecord.currentCompany,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 12, 0, 8),
                            child: Text(
                              'Salary',
                              style: FlutterFlowTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Text(
                                '\$${valueOrDefault<String>(
                                  mAINMyProfileUsersRecord.salary,
                                  '0.00',
                                )}k',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<CompaniesRecord>>(
                        stream: queryCompaniesRecord(
                          queryBuilder: (companiesRecord) =>
                              companiesRecord.where('companyName',
                                  isEqualTo:
                                      mAINMyProfileUsersRecord.currentCompany),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<CompaniesRecord> companyInfoCompaniesRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final companyInfoCompaniesRecord =
                              companyInfoCompaniesRecordList.isNotEmpty
                                  ? companyInfoCompaniesRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 12, 0, 8),
                                    child: Text(
                                      'Company Profile',
                                      style: FlutterFlowTheme.bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CompanyDetailsWidget(
                                          companyDetails:
                                              companyInfoCompaniesRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.tertiaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2,
                                          color: Color(0x3E000000),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.lineColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2, 2, 2, 2),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            companyInfoCompaniesRecord
                                                                .companyLogo,
                                                            'https://media-exp1.licdn.com/dms/image/C4E0BAQGC40-oIHom9w/company-logo_200_200/0/1618408820080?e=2159024400&v=beta&t=UGCy8dMGIwaV64iF60BrMOcrRvkRNVlnKJxDGmAAKyk',
                                                          ),
                                                          width: 40,
                                                          height: 40,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          companyInfoCompaniesRecord
                                                              .companyName,
                                                          'No Company',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .subtitle1,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    companyInfoCompaniesRecord
                                                                        .companySize,
                                                                    '0 People',
                                                                  ),
                                                                  style: FlutterFlowTheme
                                                                      .bodyText2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 8),
                      child: Text(
                        'Work Experience',
                        style: FlutterFlowTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: StreamBuilder<List<WorkHistoryRecord>>(
                    stream: queryWorkHistoryRecord(
                      queryBuilder: (workHistoryRecord) => workHistoryRecord
                          .where('user',
                              isEqualTo: mAINMyProfileUsersRecord.reference)
                          .orderBy('endDate', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<WorkHistoryRecord> listViewWorkHistoryRecordList =
                          snapshot.data;
                      if (listViewWorkHistoryRecordList.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/NoWorkHistory@2x.png',
                            width: 200,
                            height: 300,
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewWorkHistoryRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewWorkHistoryRecord =
                              listViewWorkHistoryRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: StreamBuilder<WorkHistoryRecord>(
                              stream: WorkHistoryRecord.getDocument(
                                  listViewWorkHistoryRecord.reference),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final jobPostCardWorkHistoryRecord =
                                    snapshot.data;
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x3E000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.lineColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 12, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        listViewWorkHistoryRecord
                                                            .companyLogo,
                                                        'https://media-exp1.licdn.com/dms/image/C4E0BAQGC40-oIHom9w/company-logo_200_200/0/1618408820080?e=2159024400&v=beta&t=UGCy8dMGIwaV64iF60BrMOcrRvkRNVlnKJxDGmAAKyk',
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewWorkHistoryRecord
                                                        .jobTitle,
                                                    style: FlutterFlowTheme
                                                        .subtitle1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 2, 0, 1),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewWorkHistoryRecord
                                                            .companyName,
                                                        'ACME CO.',
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .bodyText2,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                            'yMMMd',
                                                            listViewWorkHistoryRecord
                                                                .startDate),
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              FlutterFlowTheme
                                                                  .grayIcon400,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' - ${valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              'yMMMd',
                                                              listViewWorkHistoryRecord
                                                                  .endDate),
                                                          'Present',
                                                        )}',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              FlutterFlowTheme
                                                                  .grayIcon400,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Color(0xFFE62424),
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                await listViewWorkHistoryRecord
                                                    .reference
                                                    .delete();
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: FlutterFlowTheme
                                                    .grayIcon400,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: 570,
                                                        child:
                                                            WorkExpEditWidget(
                                                          workExperience:
                                                              jobPostCardWorkHistoryRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
