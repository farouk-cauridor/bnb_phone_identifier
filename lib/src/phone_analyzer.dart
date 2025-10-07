/*
 * Created by Farouk MOHAMED on 07/10/2025 10:09
 * Copyright (c) 2025 | Cauridor. All rights reserved.
 * Last modified 07/10/2025 10:09
 */

import 'package:bnb_phone_identifier/src/country_data.dart';
import 'package:bnb_phone_identifier/src/utils.dart';
import 'package:libphonenumber_plugin/libphonenumber_plugin.dart';

class PhoneAnalysisResult {
  final String raw;
  final String normalized;
  final String? country;
  final String? countryCode;
  final String? nationalPrefix;
  final bool isValid;
  final String reason;

  const PhoneAnalysisResult({
    required this.raw,
    required this.normalized,
    this.country,
    this.countryCode,
    this.nationalPrefix,
    required this.isValid,
    this.reason = '',
  });
}

class PhoneAnalyzer {
  Future<PhoneAnalysisResult> analyze(String input,
      {bool useLibPhone = false}) async {
    final raw = input;
    final normalized = normalize(input);

    if (normalized.isEmpty) {
      return PhoneAnalysisResult(
          raw: raw, normalized: normalized, isValid: false, reason: 'empty');
    }

    if (useLibPhone) {
      try {
        // Use 'US' as a generic hint; the library can still infer from +E164.
        final info = await PhoneNumberUtil.getRegionInfo(normalized, 'US');
        final String regionCode = info.isoCode ?? '';
        final valid = await PhoneNumberUtil.isValidPhoneNumber(
            normalized, regionCode);
        return PhoneAnalysisResult(
          raw: raw,
          normalized: normalized,
          country: regionCode,
          isValid: valid ?? false,
          reason: (valid ?? false) ? 'ok' : 'invalid',
        );
      } catch (_) {}
    }

    if (normalized.startsWith('+')) {
      final stripped = stripPlus(normalized);
      for (var len = 3; len >= 1; len--) {
        if (stripped.length < len) continue;
        final candidate = stripped.substring(0, len);
        final rest = stripped.substring(len);
        final cd = countryByCode[candidate];
        if (cd != null) {
          final bool lengthOk = cd.possibleLengths.contains(rest.length);
          final String prefix = cd.nationalPrefixes
              .firstWhere((np) => rest.startsWith(np), orElse: () => '');
          final bool prefixOk =
              cd.nationalPrefixes.isEmpty || prefix.isNotEmpty;
          final bool isValid = lengthOk && prefixOk;
          return PhoneAnalysisResult(
            raw: raw,
            normalized: normalized,
            country: cd.name,
            countryCode: cd.countryCode,
            nationalPrefix: prefix.isEmpty ? null : prefix,
            isValid: isValid,
            reason: isValid
                ? 'ok'
                : (!lengthOk ? 'length_mismatch' : 'invalid_prefix'),
          );
        }
      }
    }

    // Try to infer local numbers (without international prefix) for common cases
    // Senegal: length 9 and prefixes 70, 75, 76, 77, 78
    if (!normalized.startsWith('+')) {
      final local = normalized;
      final senegal = countryByCode['221'];
      if (senegal != null && senegal.possibleLengths.contains(local.length)) {
        final bool hasSnPrefix = senegal.nationalPrefixes
            .any((p) => local.startsWith(p));
        if (hasSnPrefix) {
          final e164 = '+${senegal.countryCode}$local';
          return PhoneAnalysisResult(
            raw: raw,
            normalized: e164,
            country: senegal.name,
            countryCode: senegal.countryCode,
            nationalPrefix: senegal.nationalPrefixes
                .firstWhere((p) => local.startsWith(p), orElse: () => ''),
            isValid: true,
            reason: 'inferred_local',
          );
        }
      }
    }

    return PhoneAnalysisResult(
        raw: raw, normalized: normalized, isValid: false, reason: 'no_match');
  }
}
