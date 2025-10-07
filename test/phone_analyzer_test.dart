/*
 * Created by Farouk MOHAMED on 07/10/2025 10:10
 * Copyright (c) 2025 | Cauridor. All rights reserved.
 * Last modified 07/10/2025 10:10
 */

import 'package:bnb_phone_identifier/bnb_phone_identifier.dart';
import 'package:test/test.dart';

void main() {
  final analyzer = PhoneAnalyzer();

  test('Valid Senegal number', () async {
    final result = await analyzer.analyze('+221771234567');
    expect(result.isValid, true);
    expect(result.country, 'Senegal');
  });

  test('Invalid number', () async {
    final result = await analyzer.analyze('+221123');
    expect(result.isValid, false);
    expect(result.reason, 'length_mismatch');
  });

  test('Empty input', () async {
    final result = await analyzer.analyze('');
    expect(result.isValid, false);
    expect(result.reason, 'empty');
  });

  test('Senegal local number 77xxxxxxx is inferred', () async {
    final result = await analyzer.analyze('771234567');
    expect(result.isValid, true);
    expect(result.country, 'Senegal');
    expect(result.normalized, '+221771234567');
  });

  test('Senegal local number 76xxxxxxx is inferred', () async {
    final result = await analyzer.analyze('769752077');
    expect(result.isValid, true);
    expect(result.country, 'Senegal');
    expect(result.normalized, '+221769752077');
  });

  test('Senegal local number 70xxxxxxx is inferred', () async {
    final result = await analyzer.analyze('703567382');
    expect(result.isValid, true);
    expect(result.country, 'Senegal');
    expect(result.normalized, '+221703567382');
  });
}
