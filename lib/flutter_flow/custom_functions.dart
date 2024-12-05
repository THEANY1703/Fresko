import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getNextWeek() {
  // Ottieni la data e ora corrente
  final now = DateTime.now();

  // Calcola quanti giorni mancano per arrivare al prossimo lunedì
  int daysToNextMonday = (DateTime.monday - now.weekday) + 7;

  // Calcola il primo secondo del lunedì successivo (00:00:00)
  final nextMonday = DateTime(now.year, now.month, now.day)
      .add(Duration(days: daysToNextMonday));

  // Restituisci il DateTime del prossimo lunedì alle 00:00:00
  return DateTime(nextMonday.year, nextMonday.month, nextMonday.day, 0, 0, 0);
}

DateTime getPreviousWeek() {
  // Ottieni la data e ora corrente
  final now = DateTime.now();

  // Calcola quanti giorni sono passati dall'ultimo lunedì
  int daysSinceLastMonday = (now.weekday - DateTime.monday) % 7;

  // Se è lunedì oggi, non bisogna sottrarre giorni
  if (daysSinceLastMonday == 0) {
    daysSinceLastMonday = 0;
  }

  // Calcola il primo secondo del lunedì (precedente o corrente) alle 00:00:00
  final previousMonday = DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: daysSinceLastMonday));

  // Restituisci il DateTime del lunedì alle 00:00:00
  return DateTime(
      previousMonday.year, previousMonday.month, previousMonday.day, 0, 0, 0);
}

String formatDateTime(DateTime data) {
  String giornoSettimana =
      DateFormat('EEEE', 'it_IT').format(data); // Giorno della settimana
  String giorno = DateFormat('d').format(data); // Giorno del mese
  String mese = DateFormat('MMMM', 'it_IT').format(data); // Mese
  String anno = DateFormat('y').format(data); // Anno
  String ora = DateFormat('HH:mm').format(data); // Ora nel formato 24h

  return '$giornoSettimana, $giorno $mese $anno, Ore:$ora';
}

String getUnicode(
  String nameTicket,
  double? price,
  String? username,
) {
  // Concatenazione dei dati
  String data = '$username|$price|$nameTicket';

  // Hashing dei dati usando base64 encoding
  String base64Hash = base64Encode(utf8.encode(data));

  // Rimuove caratteri non alfanumerici per creare un codice pulito
  String alphanumericHash = base64Hash.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  // Stringa casuale aggiuntiva per garantire unicità
  String randomString = List.generate(20, (index) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return chars[math.Random().nextInt(chars.length)];
  }).join();

  // Combina hash e random string
  String combinedString = alphanumericHash + randomString;

  // Assicura che il codice sia lungo esattamente 60 caratteri
  String ticketCode = combinedString.length > 60
      ? combinedString.substring(0, 60)
      : combinedString.padRight(
          60, 'X'); // Usa 'X' per riempire se troppo corto

  return ticketCode;
}
