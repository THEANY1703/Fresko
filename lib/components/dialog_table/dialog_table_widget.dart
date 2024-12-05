import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/table_composing/table_composing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'dialog_table_model.dart';
export 'dialog_table_model.dart';

class DialogTableWidget extends StatefulWidget {
  const DialogTableWidget({
    super.key,
    required this.eventReference,
    this.prList,
  });

  final DocumentReference? eventReference;
  final DocumentReference? prList;

  @override
  State<DialogTableWidget> createState() => _DialogTableWidgetState();
}

class _DialogTableWidgetState extends State<DialogTableWidget> {
  late DialogTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogTableModel());

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
                    'Prenota Il tuo Tavolo',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: ' Brigends Expanded',
                          fontSize: 21.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<TableModelRecord>>(
              stream: queryTableModelRecord(
                parent: widget.eventReference,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                    ),
                  );
                }
                List<TableModelRecord> listViewTableModelRecordList =
                    snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewTableModelRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewTableModelRecord =
                        listViewTableModelRecordList[listViewIndex];
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
                            var tablesRecordReference =
                                TablesRecord.collection.doc();
                            await tablesRecordReference.set({
                              ...createTablesRecordData(
                                title: listViewTableModelRecord.name,
                                price: listViewTableModelRecord.price,
                                event: listViewTableModelRecord.parentReference,
                                prList: widget.prList,
                                isApproved: false,
                                typeTable: listViewTableModelRecord.type,
                                capacity: 15,
                                isFull: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'Members': [currentUserReference],
                                },
                              ),
                            });
                            _model.tableref = TablesRecord.getDocumentFromData({
                              ...createTablesRecordData(
                                title: listViewTableModelRecord.name,
                                price: listViewTableModelRecord.price,
                                event: listViewTableModelRecord.parentReference,
                                prList: widget.prList,
                                isApproved: false,
                                typeTable: listViewTableModelRecord.type,
                                capacity: 15,
                                isFull: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'Members': [currentUserReference],
                                },
                              ),
                            }, tablesRecordReference);

                            var ticketRecordReference =
                                TicketRecord.collection.doc();
                            await ticketRecordReference
                                .set(createTicketRecordData(
                              title: listViewTableModelRecord.title,
                              price: listViewTableModelRecord.price,
                              event: widget.eventReference,
                              prList: widget.prList,
                              uniqueCode: functions.getUnicode(
                                  listViewTableModelRecord.name,
                                  listViewTableModelRecord.price,
                                  currentUserDisplayName),
                              user: currentUserReference,
                              isApproved: false,
                              typeTable: listViewTableModelRecord.type,
                              table: _model.tableref?.reference,
                            ));
                            _model.ticket = TicketRecord.getDocumentFromData(
                                createTicketRecordData(
                                  title: listViewTableModelRecord.title,
                                  price: listViewTableModelRecord.price,
                                  event: widget.eventReference,
                                  prList: widget.prList,
                                  uniqueCode: functions.getUnicode(
                                      listViewTableModelRecord.name,
                                      listViewTableModelRecord.price,
                                      currentUserDisplayName),
                                  user: currentUserReference,
                                  isApproved: false,
                                  typeTable: listViewTableModelRecord.type,
                                  table: _model.tableref?.reference,
                                ),
                                ticketRecordReference);

                            await widget.eventReference!.update({
                              ...mapToFirestore(
                                {
                                  'Participants': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                  'totalParticipants': FieldValue.increment(1),
                                },
                              ),
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: TableComposingWidget(
                                    tablesRef: _model.tableref!,
                                  ),
                                );
                              },
                            );

                            safeSetState(() {});
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
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          listViewTableModelRecord.title,
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Text(
                                          '${listViewTableModelRecord.price.toString()}€',
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
                                      listViewTableModelRecord.description,
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
          ],
        ),
      ),
    );
  }
}
