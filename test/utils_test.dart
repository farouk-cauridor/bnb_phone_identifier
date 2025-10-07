/*
 * Created by Farouk MOHAMED on 07/10/2025 10:10
 * Copyright (c) 2025 | Cauridor. All rights reserved.
 * Last modified 07/10/2025 10:10
 */

import 'package:bnb_phone_identifier/src/utils.dart';
import 'package:test/test.dart';

void main() {
  test('normalize removes non-numeric characters', () {
    expect(normalize('+221 77-123-4567'), '+221771234567');
  });

  test('stripPlus removes leading +', () {
    expect(stripPlus('+221771234567'), '221771234567');
    expect(stripPlus('221771234567'), '221771234567');
  });
}
