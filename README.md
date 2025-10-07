## bnb_phone_identifier

Phone number identification and validation for Dart/Flutter. This package helps you:

- Normalize raw user input to a consistent format
- Identify the country from an international calling code
- Check number validity using simple pattern rules or Google's libphonenumber
- Infer E.164 for certain local numbers (currently tailored for Senegal)
- Extract helpful details like country name, country code and national prefix

The API is small and async-friendly.

### Install

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  bnb_phone_identifier: ^1.0.0
```

If you use the optional libphonenumber integration (recommended for broad validation), the package already depends on `libphonenumber_plugin`. Follow its platform setup if needed for your target.

### Quick start

```dart
import 'package:bnb_phone_identifier/bnb_phone_identifier.dart';

Future<void> main() async {
  final analyzer = PhoneAnalyzer();

  // International format (+E.164-like) input
  final sn = await analyzer.analyze('+221771234567');
  print(sn.isValid);       // true
  print(sn.country);       // Senegal
  print(sn.countryCode);   // 221
  print(sn.nationalPrefix);// 77

  // Local Senegal number inference (adds +221)
  final local = await analyzer.analyze('771234567');
  print(local.normalized); // +221771234567
}
```

### API overview

- **`PhoneAnalyzer.analyze(String input, {bool useLibPhone = false})`** → `Future<PhoneAnalysisResult>`
  - Parses and validates `input`.
  - If `useLibPhone` is true, also tries validation via `libphonenumber_plugin`.

- **`PhoneAnalysisResult`**
  - `raw`: original input
  - `normalized`: sanitized string (keeps digits and a leading `+`)
  - `country`: detected country name (if any)
  - `countryCode`: international calling code (digits only, if any)
  - `nationalPrefix`: detected mobile prefix within the country (if any)
  - `isValid`: validity based on the chosen strategy
  - `reason`: short code such as `ok`, `invalid`, `empty`, `length_mismatch`, `inferred_local`, `no_match`

### Normalization helpers

For convenience (exported from `utils.dart`):

```dart
import 'package:bnb_phone_identifier/bnb_phone_identifier.dart';

final raw = ' (221) 77-123-45-67 ';
final normalized = normalize(raw); // + and digits only, e.g. "221771234567"
```

### Examples

#### 1) Validate an international number (simple rules)

```dart
final analyzer = PhoneAnalyzer();
final result = await analyzer.analyze('+221771234567');

if (result.isValid) {
  // result.country == 'Senegal'
}
```

#### 2) Validate using libphonenumber (broader coverage)

```dart
final analyzer = PhoneAnalyzer();
final result = await analyzer.analyze('+12025550123', useLibPhone: true);

print(result.isValid); // true/false as determined by libphonenumber
print(result.country); // Region code when available (e.g. "US")
```

#### 3) Infer Senegal local numbers

```dart
final analyzer = PhoneAnalyzer();

// Local mobile formats like 77xxxxxxx, 76xxxxxxx, 75xxxxxxx, 78xxxxxxx, 70xxxxxxx
final inferred = await analyzer.analyze('771234567');
print(inferred.normalized); // +221771234567
print(inferred.country);    // Senegal
print(inferred.isValid);    // true
```

#### 4) Handling invalid input

```dart
final analyzer = PhoneAnalyzer();
final r1 = await analyzer.analyze('');
print(r1.isValid); // false
print(r1.reason);  // 'empty'

final r2 = await analyzer.analyze('+221123');
print(r2.isValid); // false
print(r2.reason);  // 'length_mismatch' or 'no_match'
```

### How validation works

- By default, the analyzer uses a lightweight country table to:
  - Match the international calling code from a leading `+` number
  - Verify plausible national number lengths for that country
  - Optionally detect national/mobile prefixes
- If `useLibPhone: true`, the analyzer also invokes `libphonenumber_plugin` for a stricter, globally maintained validation.
- When the input does not start with `+`, the analyzer currently tries to infer Senegal numbers if they look like valid local mobile numbers. This is intentional for workflows focused on West Africa. You can always bypass inference by supplying a fully qualified `+` number.

### Notes and limitations

- The bundled country data is intentionally compact and not exhaustive. For production-grade global validation, prefer `useLibPhone: true`.
- Local number inference is currently implemented for Senegal. Feel free to open a PR to add more countries if this is useful to you.
- `normalized` keeps only digits and an optional leading `+`. Formatting and separators are removed.

### Testing

Run the test suite:

```bash
dart test
```

### Contributing

Issues and PRs are welcome. Please include tests for new behavior. If you add new countries or prefixes, keep entries concise and include references.

### License

MIT © Cauridor
