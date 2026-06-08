part of '../widget.dart';

/// Localization strings for [SPPhoneNumberField].
///
/// Pass a custom instance to override the default English messages:
///
/// ```dart
/// SPPhoneNumberField(
///   name: 'phone',
///   placeHolder: '812 345 678',
///   l10n: PhoneInputL10n(
///     requiredField: 'Champ obligatoire',
///     invalidPhoneNumber: 'Numéro invalide',
///   ),
/// )
/// ```
class PhoneInputL10n {
  /// Message shown when the field is empty and [SPPhoneNumberField.required] is `true`.
  final String requiredField;

  /// Message shown when the entered phone number fails validation.
  final String invalidPhoneNumber;

  const PhoneInputL10n({
    this.requiredField = 'This field is required',
    this.invalidPhoneNumber = 'Invalid phone number',
  });
}

/// A form field for entering an international phone number.
///
/// Combines a country-code selector (flag + dial code) with a number input.
/// The selected country defaults to the Democratic Republic of Congo (+243).
/// The field stores the full E.164-formatted number (e.g. `+243812345678`)
/// in the parent [FormBuilder] under [name].
///
/// ### Basic usage
/// ```dart
/// SPPhoneNumberField(
///   name: 'phone',
///   placeHolder: '812 345 678',
///   label: 'Phone number',
/// )
/// ```
///
/// ### With localization
/// ```dart
/// SPPhoneNumberField(
///   name: 'phone',
///   placeHolder: '812 345 678',
///   required: true,
///   l10n: PhoneInputL10n(
///     requiredField: 'Ce champ est obligatoire',
///     invalidPhoneNumber: 'Numéro invalide',
///   ),
/// )
/// ```
class SPPhoneNumberField extends StatefulWidget {
  /// The key used to identify this field inside a [FormBuilder].
  final String name;

  /// Hint text shown inside the number input when it is empty.
  final String placeHolder;

  /// Optional label displayed above the field.
  final String? label;

  /// Pre-filled phone number in any format parseable by `phone_numbers_parser`
  /// (e.g. `+243812345678`). The country selector is initialised from this value.
  final String? initialValue;

  /// Whether the field must be non-empty to pass validation.
  final bool required;

  /// Font size for the label text.
  final double? labelSize;

  /// Font size for the input text and hint.
  final double? fontSize;

  /// Fixed height of the input container.
  final double? height;

  /// Localized strings used in validation messages.
  /// Defaults to English. Supply a custom [PhoneInputL10n] to override.
  final PhoneInputL10n l10n;

  const SPPhoneNumberField({
    super.key,
    required this.name,
    required this.placeHolder,
    this.labelSize,
    this.label,
    this.initialValue,
    this.fontSize,
    this.height,
    this.required = false,
    this.l10n = const PhoneInputL10n(),
  });

  @override
  State<SPPhoneNumberField> createState() => _SPPhoneNumberFieldState();
}

class _SPPhoneNumberFieldState extends State<SPPhoneNumberField> {
  static final _countryService = CountryService();
  static final _digitsOnly = RegExp(r'^\d+$');
  static final _whitespaceOrDash = RegExp(r'[\s-]');

  late Country _selectedCountry;
  late IsoCode? _isoCode;
  late String _currentNsn;
  PhoneNumber? _phoneNormalized;

  @override
  void initState() {
    super.initState();
    try {
      final value = widget.initialValue;
      if (value != null && value.trim().isNotEmpty) {
        final parsed = PhoneNumber.parse(value);
        if (parsed.isValid()) _phoneNormalized = parsed;
      }
    } catch (_) {}

    _selectedCountry = _countryService.findByPhoneCode(
          _phoneNormalized?.countryCode ?? '243',
        ) ??
        _countryService.findByCode('CD') ??
        _countryService.getAll().first;
    _currentNsn = _phoneNormalized?.nsn ?? '';
    _isoCode = _resolveIsoCode(_selectedCountry.countryCode);
  }

  /// Maps a two-letter ISO country code to the matching [IsoCode] enum value
  /// used by `phone_numbers_parser` for validation hints.
  static IsoCode? _resolveIsoCode(String countryCode) {
    final lower = countryCode.toLowerCase();
    try {
      return IsoCode.values.firstWhere((e) => e.name == lower);
    } catch (_) {
      return null;
    }
  }

  /// Combines the current dial code with [nsn] and returns the E.164 string,
  /// or the raw concatenation when the number cannot be validated.
  String? _buildFullPhone(String? nsn) {
    if (nsn == null || nsn.trim().isEmpty) return null;
    final clean = nsn.trim().replaceAll(_whitespaceOrDash, '');
    final constructed = '+${_selectedCountry.phoneCode}$clean';
    try {
      final parsed = PhoneNumber.parse(constructed, callerCountry: _isoCode);
      if (parsed.isValid()) return '+${parsed.countryCode}${parsed.nsn}';
    } catch (_) {}
    return constructed;
  }

  void _openCountryPicker(FormFieldState<String> field) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CD', 'FR'],
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
          _isoCode = _resolveIsoCode(country.countryCode);
        });
        field.didChange(_buildFullPhone(_currentNsn));
      },
    );
  }

  String? _validate(String? value) {
    final isEmpty = value == null || value.trim().isEmpty;
    if (isEmpty) return widget.required ? widget.l10n.requiredField : null;
    try {
      final parsed = PhoneNumber.parse(value);
      final nsn = parsed.nsn;
      if (!_digitsOnly.hasMatch(nsn)) return widget.l10n.invalidPhoneNumber;
      // DRC numbers starting with 96 must be exactly 9 digits (Airtel/Orange).
      if (parsed.countryCode == '243' && nsn.startsWith('96')) {
        return nsn.length != 9 ? widget.l10n.invalidPhoneNumber : null;
      }
      if (!parsed.isValid()) return widget.l10n.invalidPhoneNumber;
    } catch (_) {
      return widget.l10n.invalidPhoneNumber;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      initialValue: widget.initialValue,
      validator: _validate,
      builder: (FormFieldState<String> field) {
        return SPTextField(
          name: '${widget.name}__nsn',
          keyboardType: TextInputType.phone,
          height: widget.height,
          initialValue: _phoneNormalized?.nsn,
          placeHolder: widget.placeHolder,
          label: widget.label,
          fontSize: widget.fontSize,
          fontSizeLabel: widget.labelSize,
          hintStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          prefix: InkWell(
            onTap: () => _openCountryPicker(field),
            child: SizedBox(
              width: 130,
              height: 48,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      _selectedCountry.flagEmoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                  const VerticalDivider(),
                  SPText('(+${_selectedCountry.phoneCode}) '),
                ],
              ),
            ),
          ),
          onChanged: (nsn) {
            _currentNsn = nsn ?? '';
            field.didChange(_buildFullPhone(nsn));
          },
        );
      },
    );
  }
}
