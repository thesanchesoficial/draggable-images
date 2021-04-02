import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:draggable/theme/app_theme.dart';

class MSTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final String helperText;
  final bool readOnly;
  final Icon icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final FormFieldValidator<String> validatorHandler;
  final ValueChanged<String> onFieldSubmitted;
  final FocusNode focusNode;
  final bool textIsObscure;
  final ValueChanged<String> onChanged;
  final Function onTap;
  final FormFieldSetter<String> onSaved;
  final VoidCallback onPressedSuffix;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final EdgeInsets margin;
  final bool enabled;
  final bool enableInteractive;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final bool maxLengthEnforced;
  final String counterText;
  final Color color;
  final List<TextInputFormatter> inputFormatters;
  final String suffixText;
  final String prefixText;

  const MSTextField({
    Key key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.controller,
    this.validatorHandler,
    this.textInputAction = TextInputAction.next,
    this.textIsObscure = false,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onPressedSuffix,
    this.onSaved,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.margin,
    this.enabled,
    this.enableInteractive,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLengthEnforced = true,
    this.counterText,
    this.color,
    this.inputFormatters,
    this.prefixText,
    this.suffixText,
  })  : icon = null,
        super(key: key);

  const MSTextField.withSuffix({
    Key key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.readOnly = false,
    this.keyboardType,
    this.controller,
    this.validatorHandler,
    this.textInputAction = TextInputAction.next,
    this.textIsObscure = false,
    this.onFieldSubmitted,
    this.focusNode,
    @required this.icon,
    this.onChanged,
    this.onTap,
    this.onPressedSuffix,
    this.onSaved,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.margin,
    this.enabled,
    this.enableInteractive,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLengthEnforced = true,
    this.counterText,
    this.color,
    this.inputFormatters,
    this.prefixText,
    this.suffixText,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        //color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        inputFormatters: inputFormatters ??
          [
            BlacklistingTextInputFormatter(RegExp("")),
          ],
        minLines: minLines,
        maxLines: maxLines,
        maxLengthEnforced: maxLengthEnforced,
        enabled: enabled ?? true,
        enableInteractiveSelection: enableInteractive ?? true,
        decoration: InputDecoration(
          filled: true,
          fillColor: color ?? Theme.of(context).cardColor,
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          counterText: counterText,
          alignLabelWithHint: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          labelStyle: TextStyle(
            color: Theme.of(context).primaryTextTheme.bodyText1.color,
          ),
          errorBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppTheme.errorColor),
          ),
          helperText: helperText,
          helperMaxLines: 3,
          errorStyle: const TextStyle(color: AppTheme.errorColor),
          suffixText: suffixText,
          prefixText: prefixText,
          suffixIcon: (icon != null)
            ? IconButton(
                icon: icon,
                onPressed: onPressedSuffix,
              )
            : null,
        ),
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
        maxLength: maxLength,
        readOnly: readOnly,
        validator: validatorHandler,
        controller: controller,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: textIsObscure,
        autofocus: autofocus,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      ),
    );
  }
}
