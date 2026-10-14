import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

class CustomTextFromField extends StatefulWidget {
  const CustomTextFromField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
    this.onTap,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.isPassword = false,
    this.isRequired = false,
    this.showClearButton = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.unfocusOnTapOutside = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.showCounter = false,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.fillColor,
    this.borderRadius,
    this.contentPadding,
  });

  // ── Controllers ──
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue; // ignored when controller is provided

  // ── Texts ──
  final String? label; // shown above the field
  final String? hint;
  final String? helperText;
  final String? errorText; // e.g. server-side error

  // ── Icons ──
  final Widget? prefixIcon;
  final String? prefixText; // e.g. "+880"
  final Widget? suffixIcon;

  // ── Callbacks ──
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;

  // ── Input behaviour ──
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;

  // ── Flags ──
  final bool isPassword;
  final bool isRequired; // adds * and a default "required" validator
  final bool showClearButton;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool unfocusOnTapOutside;

  // ── Size / length ──
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool showCounter;

  // ── Style overrides ──
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  // ───────────────────────── Variants ─────────────────────────

  factory CustomTextFromField.email({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? label = 'Email',
    String? hint = 'you@example.com',
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    TextInputAction textInputAction = TextInputAction.next,
    bool isRequired = true,
    bool enabled = true,
  }) {
    return CustomTextFromField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      isRequired: isRequired,
      enabled: enabled,
      prefixIcon: Icon(Icons.email_outlined),
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      autofillHints: const [AutofillHints.email],
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  /// For login: required + min 6 chars by default.
  factory CustomTextFromField.password({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? label = 'Password',
    String? hint = 'Enter your password',
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    TextInputAction textInputAction = TextInputAction.done,
    bool isNewPassword = false, // true on sign-up / reset screens
    bool isRequired = true,
    bool enabled = true,
  }) {
    return CustomTextFromField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      isPassword: true,
      isRequired: isRequired,
      enabled: enabled,
      prefixIcon: Icon(Icons.lock_outline),
      textInputAction: textInputAction,
      autofillHints: [
        isNewPassword ? AutofillHints.newPassword : AutofillHints.password,
      ],
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  /// Bangladesh phone validation by default.
  factory CustomTextFromField.phone({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? label = 'Phone Number',
    String? hint = '01XXXXXXXXX',
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    TextInputAction textInputAction = TextInputAction.next,
    bool isRequired = true,
    bool enabled = true,
  }) {
    return CustomTextFromField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      isRequired: isRequired,
      enabled: enabled,
      prefixIcon: Icon(Icons.phone_android_outlined),
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      maxLength: 14,
      autofillHints: const [AutofillHints.telephoneNumber],
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))],
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  factory CustomTextFromField.search({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? hint = 'Search...',
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    bool autofocus = false,
  }) {
    return CustomTextFromField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hint: hint,
      autofocus: autofocus,
      prefixIcon:   Icon(Icons.search),
      showClearButton: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      borderRadius: AppRadius.circularFull,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  factory CustomTextFromField.multiline({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? label,
    String? hint,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    int minLines = 3,
    int maxLines = 6,
    int? maxLength = 500,
    bool isRequired = false,
    bool enabled = true,
  }) {
    return CustomTextFromField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      isRequired: isRequired,
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      showCounter: true,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      validator: validator,
      onChanged: onChanged,
    );
  }

  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late final bool _ownsController;
  late final bool _ownsFocusNode;

  late bool _obscure;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _ownsFocusNode = widget.focusNode == null;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = widget.focusNode ?? FocusNode();
    _obscure = widget.isPassword;
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText && mounted) {
      setState(() => _hasText = hasText);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (_ownsController) _controller.dispose();
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  // ── Suffix: clear button + password toggle + custom icon ──
  Widget? _buildSuffix() {
    final items = <Widget>[];

    if (widget.showClearButton &&
        _hasText &&
        widget.enabled &&
        !widget.readOnly) {
      items.add(
        IconButton(
          tooltip: 'Clear',
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.cancel, size: AppSize.iconSm),
          onPressed: () {
            _controller.clear();
            widget.onChanged?.call('');
          },
        ),
      );
    }

    if (widget.isPassword) {
      items.add(
        IconButton(
          tooltip: _obscure ? 'Show password' : 'Hide password',
          visualDensity: VisualDensity.compact,
          icon: Icon(
            _obscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: AppSize.iconMd,
          ),
          onPressed:
          widget.enabled ? () => setState(() => _obscure = !_obscure) : null,
        ),
      );
    }

    if (widget.suffixIcon != null) items.add(widget.suffixIcon!);

    if (items.isEmpty) return null;
    if (items.length == 1) return items.first;
    return Row(mainAxisSize: MainAxisSize.min, children: items);
  }

  // Applies custom radius on top of the theme borders.
  InputBorder? _withRadius(InputBorder? border) {
    if (widget.borderRadius == null) return null; // fall back to theme
    if (border is OutlineInputBorder) {
      return border.copyWith(borderRadius: widget.borderRadius);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;

    final bool multiline = !widget.isPassword && widget.maxLines != 1;
    final FormFieldValidator<String>? effectiveValidator = widget.validator ??
        (widget.isRequired
            ? (val) {
          if (val == null || val.trim().isEmpty) {
            return widget.label != null
                ? '${widget.label} is required'
                : 'This field is required';
          }
          return null;
        }
            : null);

    final field = TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      validator: effectiveValidator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onTapOutside: widget.unfocusOnTapOutside
          ? (_) => FocusManager.instance.primaryFocus?.unfocus()
          : null,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      obscureText: _obscure,
      obscuringCharacter: '•',
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      keyboardType: widget.keyboardType ??
          (widget.isPassword
              ? TextInputType.visiblePassword
              : (multiline ? TextInputType.multiline : TextInputType.text)),
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      textAlignVertical: multiline ? TextAlignVertical.top : null,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.isPassword ? 1 : widget.minLines,
      maxLength: widget.maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      style: widget.textStyle ?? theme.textTheme.bodyLarge,
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        hintText: widget.hint,
        helperText: widget.helperText,
        errorText: widget.errorText,
        helperMaxLines: 2,
        errorMaxLines: 3,
        counterText: widget.showCounter ? null : '',
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        suffixIcon: _buildSuffix(),
        filled: widget.fillColor != null ? true : null,
        fillColor: widget.fillColor,
        contentPadding: widget.contentPadding,
        border: _withRadius(inputTheme.border),
        enabledBorder: _withRadius(inputTheme.enabledBorder),
        focusedBorder: _withRadius(inputTheme.focusedBorder),
        errorBorder: _withRadius(inputTheme.errorBorder),
        focusedErrorBorder: _withRadius(inputTheme.focusedErrorBorder),
        disabledBorder: _withRadius(inputTheme.disabledBorder),
      ),
    );

    if (widget.label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: widget.label,
            style: theme.textTheme.titleSmall,
            children: [
              if (widget.isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColor.error),
                ),
            ],
          ),
        ),
        AppGap.h8,
        field,
      ],
    );
  }
}

//
// CustomTextFromField(
// label: 'Full Name',
// hint: 'আপনার নাম লিখুন',
// isRequired: true,
// onChanged: (value) {
// print(value);
// },
// )