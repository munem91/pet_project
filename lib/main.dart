import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_project/crypto_curencies_list_app.dart';
import 'package:get_it/get_it.dart';
import 'repositories/crypto_coins/crypro_coins.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurenciesListApp());
}
