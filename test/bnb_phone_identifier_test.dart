import 'package:bnb_phone_identifier/bnb_phone_identifier.dart';
import 'package:test/test.dart';

void main() {
  final analyzer = PhoneAnalyzer();

  group('bnb_phone_identifier general tests', () {
    test('Valid number for Senegal', () async {
      final result = await analyzer.analyze('+221771234567');
      expect(result.isValid, true);
      expect(result.country, 'Senegal');
      expect(result.countryCode, '221');
      expect(result.nationalPrefix, '77');
    });

    test('Invalid number with wrong length', () async {
      final result = await analyzer.analyze('+221123');
      expect(result.isValid, false);
      expect(result.reason, 'length_mismatch');
    });

    test('Empty input returns invalid', () async {
      final result = await analyzer.analyze('');
      expect(result.isValid, false);
      expect(result.reason, 'empty');
    });

    test('Number normalization', () {
      final normalized = normalize('+221 77-123-4567');
      expect(normalized, '+221771234567');
    });

    test('stripPlus removes leading +', () {
      final stripped = stripPlus('+221771234567');
      expect(stripped, '221771234567');
    });
  });
}
