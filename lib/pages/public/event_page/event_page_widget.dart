import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dialog_ticket/dialog_ticket_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'event_page_model.dart';
export 'event_page_model.dart';

class EventPageWidget extends StatefulWidget {
  const EventPageWidget({
    super.key,
    required this.eventId,
    this.list,
    this.table,
    this.ticketTable,
  });

  final DocumentReference? eventId;
  final DocumentReference? list;
  final DocumentReference? table;
  final DocumentReference? ticketTable;

  @override
  State<EventPageWidget> createState() => _EventPageWidgetState();
}

class _EventPageWidgetState extends State<EventPageWidget>
    with TickerProviderStateMixin {
  late EventPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.checkFull(context);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return StreamBuilder<EventRecord>(
      stream: EventRecord.getDocument(widget.eventId!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final eventPageEventRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(-0.3, 0.0),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 570.0,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x17FFF9F9),
                                FlutterFlowTheme.of(context).primary
                              ],
                              stops: const [0.0, 0.6],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (_model.ticketExist == true) {
                                      return StreamBuilder<List<TicketRecord>>(
                                        stream: queryTicketRecord(
                                          queryBuilder: (ticketRecord) =>
                                              ticketRecord
                                                  .where(
                                                    'Event',
                                                    isEqualTo: widget.eventId,
                                                  )
                                                  .where(
                                                    'User',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                          singleRecord: true,
                                        )..listen((snapshot) {
                                            List<TicketRecord>
                                                flippableCardTicketRecordList =
                                                snapshot;
                                            final flippableCardTicketRecord =
                                                flippableCardTicketRecordList
                                                        .isNotEmpty
                                                    ? flippableCardTicketRecordList
                                                        .first
                                                    : null;
                                            if (_model.flippableCardPreviousSnapshot !=
                                                    null &&
                                                !const ListEquality(
                                                        TicketRecordDocumentEquality())
                                                    .equals(
                                                        flippableCardTicketRecordList,
                                                        _model
                                                            .flippableCardPreviousSnapshot)) {
                                              () async {}();
                                            }
                                            _model.flippableCardPreviousSnapshot =
                                                snapshot;
                                          }),
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
                                          List<TicketRecord>
                                              flippableCardTicketRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final flippableCardTicketRecord =
                                              flippableCardTicketRecordList
                                                      .isNotEmpty
                                                  ? flippableCardTicketRecordList
                                                      .first
                                                  : null;

                                          return FlipCard(
                                            fill: Fill.fillBack,
                                            direction: FlipDirection.HORIZONTAL,
                                            speed: 400,
                                            front: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 30.0),
                                              child: Container(
                                                width: 370.0,
                                                height: 350.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFF505050),
                                                      Color(0xFF181818)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(25.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Image.network(
                                                      eventPageEventRecord
                                                          .images,
                                                      width: 400.0,
                                                      height: 300.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            back: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 30.0),
                                                child: Container(
                                                  width: 370.0,
                                                  height: 350.0,
                                                  decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xFF505050),
                                                        Color(0xFF181818)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(25.0),
                                                    child: BarcodeWidget(
                                                      data:
                                                          'Fresko=${flippableCardTicketRecord?.uniqueCode}',
                                                      barcode: Barcode.qrCode(),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      color: Colors.white,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      errorBuilder:
                                                          (context, error) =>
                                                              const SizedBox(
                                                        width: 200.0,
                                                        height: 200.0,
                                                      ),
                                                      drawText: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 30.0),
                                        child: Container(
                                          width: 370.0,
                                          height: 350.0,
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF505050),
                                                Color(0xFF181818)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  eventPageEventRecord.images,
                                                  'https://firebasestorage.googleapis.com/v0/b/fresko-1e75d.appspot.com/o/users%2FfIm8tosqbeea1Hml8qEIRpFUGiM2%2Fuploads%2F1732136426067000.jpeg?alt=media&token=5897cd1f-995a-482e-8fbc-3da80c2bca4f',
                                                ),
                                                width: 400.0,
                                                height: 300.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if ((currentUserDocument?.role ==
                                            Role.Pr) ||
                                        (currentUserDocument?.role ==
                                            Role.Organaizer))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 25.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  await Share.share(
                                                    'https://fresko.page.link/eventPage?eventId=${widget.eventId?.id}?prlistdp=',
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );
                                                },
                                                text: 'Genera Link Pr',
                                                options: FFButtonOptions(
                                                  height: 25.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xA44B7EFF),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  eventPageEventRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 25.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 17.0),
                                  child: Text(
                                    functions.formatDateTime(
                                        eventPageEventRecord.dateEvent!),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: const Color(0xFF4B7EFF),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: StreamBuilder<LocationRecord>(
                                    stream: LocationRecord.getDocument(
                                        eventPageEventRecord.location!),
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

                                      final propertyDetailsLocationRecord =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(26.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      propertyDetailsLocationRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Scopri',
                                                      options: FFButtonOptions(
                                                        height: 21.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  propertyDetailsLocationRecord
                                                      .address,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FlutterFlowStaticMap(
                                                    location: LatLng(
                                                        37.50143277842129,
                                                        15.084216683540053),
                                                    apiKey:
                                                        'pk.eyJ1IjoidGhlYW55MTcwMyIsImEiOiJjbTJhanZvcWUwaTF2MnFzZTE4aW5nNGd3In0.rrr0CP5fvyA2cT2lNDGiCQ',
                                                    style:
                                                        mapbox.MapBoxStyle.Dark,
                                                    width: 327.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                    markerUrl:
                                                        'mapbox://styles/theany1703/cm2ak7z8600qv01r217mi0e35',
                                                    zoom: 16,
                                                    tilt: 0,
                                                    rotation: 0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 5.0),
                                    child: Text(
                                      'Dettagli evento ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      60.0, 8.0, 60.0, 12.0),
                                  child: Text(
                                    eventPageEventRecord.description,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Organizzato da',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: ' Brigends Expanded',
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 62.0),
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
                                                child: StreamBuilder<
                                                    List<OrganizationRecord>>(
                                                  stream:
                                                      queryOrganizationRecord(
                                                    limit: 5,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFadingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrganizationRecord>
                                                        listViewOrganizationRecordList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          listViewOrganizationRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewOrganizationRecord =
                                                            listViewOrganizationRecordList[
                                                                listViewIndex];
                                                        return Visibility(
                                                          visible: eventPageEventRecord
                                                                  .organizers
                                                                  .contains(
                                                                      listViewOrganizationRecord
                                                                          .reference) ==
                                                              true,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x50090F13),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              9.0),
                                                                      child: Image
                                                                          .network(
                                                                        listViewOrganizationRecord
                                                                            .logo,
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      listViewOrganizationRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation']!),
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
                                      ),
                                    ],
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
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (_model.ticketExist == false) {
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: DialogTicketWidget(
                                                    eventReference:
                                                        widget.eventId!,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Prenota il tuo biglietto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 12.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Clicca sulla locandina e visualizza il tuo ticket',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                );
                              }
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
        );
      },
    );
  }
}
