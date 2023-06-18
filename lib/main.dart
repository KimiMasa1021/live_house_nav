import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


// https://maps.googleapis.com/maps/api/place/photo
//   ?maxwidth=400
//   &photo_reference=AZose0kA1Lfwel5zMaDu8kzAEyqsu1mzJ9E6uyjwNXOaszEP4QtsJHlBNfhJdLRnWB-G4r-8pqpPMTyGRUUzw34Sxtfjeksq7I2LOKQ5RVJ7a-4OnQTC5xgFVIfaoifN52IUX7f0x4mHj-XyVWlOFv3osYdV5C9G-459NTBdhzo6DLfKtdOO
//   &key=AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M