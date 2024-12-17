import '/backend/backend.dart';
import '/components/nav_nuova/nav_nuova_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 660.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 660.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'FRESKO',
              style: FlutterFlowTheme.of(context).displayLarge.override(
                    fontFamily: ' Brigends Expanded',
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Container(
              width: 393.0,
              height: 113.0,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 400.0,
                    color: Color(0xC0CF3A0A),
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 111.0,
                                  height: 89.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<List<TagRecord>>(
                                          stream: queryTagRecord(
                                            limit: 5,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFadingCube(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TagRecord>
                                                listViewTagRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewTagRecordList.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(width: 15.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewTagRecord =
                                                    listViewTagRecordList[
                                                        listViewIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'tagPage',
                                                      queryParameters: {
                                                        'tagSelected':
                                                            serializeParam(
                                                          listViewTagRecord
                                                              .dispalyName,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          'https://images.unsplash.com/photo-1654031623184-d998eae6ce25?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8bXVzaWMlMjBid3xlbnwwfHx8fDE3MzQwMzYwMzB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                        ).image,
                                                      ),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                          valueOrDefault<Color>(
                                                            FFAppConstants
                                                                .tagsColor
                                                                .elementAtOrNull(
                                                                    listViewIndex),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          )
                                                        ],
                                                        stops: const [0.0, 1.0],
                                                        begin:
                                                            const AlignmentDirectional(
                                                                1.0, -1.0),
                                                        end:
                                                            const AlignmentDirectional(
                                                                -1.0, 1.0),
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          listViewTagRecord
                                                              .dispalyName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation1']!);
                                              },
                                            );
                                          },
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prossimi eventi',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 120.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<List<EventRecord>>(
                                          stream: queryEventRecord(
                                            queryBuilder: (eventRecord) =>
                                                eventRecord
                                                    .where(
                                                      'DateEvent',
                                                      isLessThanOrEqualTo:
                                                          functions
                                                              .getNextWeek(),
                                                    )
                                                    .where(
                                                      'DateEvent',
                                                      isGreaterThanOrEqualTo:
                                                          functions
                                                              .getPreviousWeek(),
                                                    ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFadingCube(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<EventRecord>
                                                listViewEventRecordList =
                                                snapshot.data!;

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: listViewEventRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewEventRecord =
                                                    listViewEventRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.goNamed(
                                                        'EventPage',
                                                        queryParameters: {
                                                          'eventId':
                                                              serializeParam(
                                                            listViewEventRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x50090F13),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewEventRecord
                                                                    .images,
                                                                'https://firebasestorage.googleapis.com/v0/b/fresko-1e75d.appspot.com/o/users%2FfIm8tosqbeea1Hml8qEIRpFUGiM2%2Fuploads%2F1732136426067000.jpeg?alt=media&token=5897cd1f-995a-482e-8fbc-3da80c2bca4f',
                                                              ),
                                                              width: 111.0,
                                                              height: 95.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewEventRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation2']!),
                                                );
                                              },
                                            );
                                          },
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
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tutti gli eventi',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  child: StreamBuilder<List<EventRecord>>(
                                    stream: queryEventRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitFadingCube(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<EventRecord>
                                          gridViewEventRecordList =
                                          snapshot.data!;

                                      return GridView.builder(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          10.0,
                                          0,
                                          10.0,
                                        ),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            gridViewEventRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewEventRecord =
                                              gridViewEventRecordList[
                                                  gridViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'EventPage',
                                                queryParameters: {
                                                  'eventId': serializeParam(
                                                    gridViewEventRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  gridViewEventRecord.images,
                                                  'https://firebasestorage.googleapis.com/v0/b/fresko-1e75d.appspot.com/o/users%2FfIm8tosqbeea1Hml8qEIRpFUGiM2%2Fuploads%2F1732136426067000.jpeg?alt=media&token=5897cd1f-995a-482e-8fbc-3da80c2bca4f',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: 365.0,
                    height: 111.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.navNuovaModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavNuovaWidget(
                        pA: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
