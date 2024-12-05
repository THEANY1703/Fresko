import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/table_composing/table_composing_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_page_widget.dart' show EventPageWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class EventPageModel extends FlutterFlowModel<EventPageWidget> {
  ///  Local state fields for this page.

  bool? ticketExist;

  ///  State fields for stateful widgets in this page.

  List<TicketRecord>? flippableCardPreviousSnapshot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future check(BuildContext context) async {
    TicketRecord? ticketSbric;

    ticketSbric = await queryTicketRecordOnce(
      queryBuilder: (ticketRecord) => ticketRecord
          .where(
            'Event',
            isEqualTo: widget!.eventId,
          )
          .where(
            'User',
            isEqualTo: currentUserReference,
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (ticketSbric?.reference != null) {
      ticketExist = true;
    } else {
      ticketExist = false;
    }
  }

  Future checkFull(BuildContext context) async {
    TicketRecord? ticketSbric;

    ticketSbric = await queryTicketRecordOnce(
      queryBuilder: (ticketRecord) => ticketRecord
          .where(
            'Event',
            isEqualTo: widget!.eventId,
          )
          .where(
            'User',
            isEqualTo: currentUserReference,
          )
          .where(
            'IsApproved',
            isEqualTo: true,
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (ticketSbric?.reference != null) {
      ticketExist = true;
    } else {
      ticketExist = false;
    }
  }

  Future tableShare(BuildContext context) async {
    TicketRecord? ticket;
    TablesRecord? tables;

    if ((widget!.table?.id != null && widget!.table?.id != '') &&
        (widget!.ticketTable?.id != null && widget!.ticketTable?.id != '')) {
      await Future.delayed(const Duration(milliseconds: 500));
      ticket = await TicketRecord.getDocumentOnce(widget!.ticketTable!);
      tables = await TablesRecord.getDocumentOnce(widget!.table!);
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: TableComposingWidget(
                tablesRef: tables!,
              ),
            ),
          );
        },
      );
    }
  }
}
