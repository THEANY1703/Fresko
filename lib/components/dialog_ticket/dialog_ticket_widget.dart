import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialog_table/dialog_table_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dialog_ticket_model.dart';
export 'dialog_ticket_model.dart';

class DialogTicketWidget extends StatefulWidget {
  const DialogTicketWidget({
    super.key,
    required this.eventReference,
    this.prList,
  });

  final DocumentReference? eventReference;
  final DocumentReference? prList;

  @override
  State<DialogTicketWidget> createState() => _DialogTicketWidgetState();
}

class _DialogTicketWidgetState extends State<DialogTicketWidget> {
  late DialogTicketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogTicketModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
          colors: [Color(0x53505050), Color(0xFF181818)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(24.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Prenota Il tuo biglietto',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lato',
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: StreamBuilder<List<TicketModelsRecord>>(
                stream: queryTicketModelsRecord(
                  parent: widget.eventReference,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitFadingCube(
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<TicketModelsRecord> listViewTicketModelsRecordList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTicketModelsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTicketModelsRecord =
                          listViewTicketModelsRecordList[listViewIndex];
                      return Builder(
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
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: DialogWidget(
                                      title:
                                          'Sei sicuro di voler prenotare il ticket? ',
                                      dettails:
                                          'se cliccli conferma invierai il tuo biglietto definitivamente, non potrai prenotare più biglietti',
                                      confirmCB: () async {
                                        if ((listViewTicketModelsRecord.type ==
                                                TicketType.Normale) ||
                                            (listViewTicketModelsRecord.type ==
                                                TicketType.Vip)) {
                                          if (listViewTicketModelsRecord.type ==
                                              TicketType.Normale) {
                                            await TicketRecord.collection
                                                .doc()
                                                .set(createTicketRecordData(
                                                  title:
                                                      listViewTicketModelsRecord
                                                          .title,
                                                  price:
                                                      listViewTicketModelsRecord
                                                          .price,
                                                  event: widget.eventReference,
                                                  prList: widget.prList,
                                                  uniqueCode: functions.getUnicode(
                                                      listViewTicketModelsRecord
                                                          .name,
                                                      listViewTicketModelsRecord
                                                          .price,
                                                      currentUserDisplayName),
                                                  user: currentUserReference,
                                                  isApproved: true,
                                                  typeTicket:
                                                      listViewTicketModelsRecord
                                                          .type,
                                                ));

                                            await widget.eventReference!
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Participants':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                  'totalParticipants':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                          } else {
                                            await TicketRecord.collection
                                                .doc()
                                                .set(createTicketRecordData(
                                                  title:
                                                      listViewTicketModelsRecord
                                                          .title,
                                                  price:
                                                      listViewTicketModelsRecord
                                                          .price,
                                                  event: widget.eventReference,
                                                  prList: widget.prList,
                                                  uniqueCode: functions.getUnicode(
                                                      listViewTicketModelsRecord
                                                          .name,
                                                      listViewTicketModelsRecord
                                                          .price,
                                                      currentUserDisplayName),
                                                  user: currentUserReference,
                                                  isApproved: false,
                                                  typeTicket:
                                                      listViewTicketModelsRecord
                                                          .type,
                                                ));
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                          }
                                        }
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              constraints: const BoxConstraints(
                                minWidth: 50.0,
                                minHeight: 50.0,
                                maxWidth: 250.0,
                                maxHeight: 50.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xB3EA5928),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            listViewTicketModelsRecord.title,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            '${listViewTicketModelsRecord.price.toString()}€',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        listViewTicketModelsRecord.description,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
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
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: DialogTableWidget(
                            eventReference: widget.eventReference!,
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50.0,
                    constraints: const BoxConstraints(
                      minWidth: 50.0,
                      minHeight: 70.0,
                      maxWidth: 300.0,
                      maxHeight: 70.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xB3EA5928),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Tavolo privè',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Invita gli amici, scegli la formula e attendi l\'approvazione',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
