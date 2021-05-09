import 'package:flutter/material.dart';
import 'package:special_day/home_page.dart';
import 'package:special_day/exibition_bottom_sheet.dart';

String tab2Moments;
String tab1Link;
String tab2Link;
String tab3Link;
String tab3Moments;
String tab1Moments;
String event;
String date;
String oneLiner;

String tab1Title;
String tab1Details;

String tab2Title;
String tab2Details;

String tab3Title;
String tab3Details;

class SimpleTextFields extends StatelessWidget {
  //https://images.g2crowd.com/uploads/product/image/social_landscape/social_landscape_923ef572cc49bf3eeff4d7a5ca53aff8/bitly.png
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: intersperse(
                SizedBox(
                  height: 32,
                ),
                [
                  SimpleTextField(
                      labelText: 'Event',
                      onChanged: (value) {
                        event = value;
                      }),
                  SimpleTextField(
                      labelText: 'Date',
                      onChanged: (value) {
                        date = value;
                      }),
                  SimpleTextField(
                      labelText: "Event One Liner",
                      onChanged: (value) {
                        oneLiner = value;
                      }),
                  Divider(),
                  Text('TAB 1'),
                  SimpleTextField(
                    labelText: "Image Link",
                    onChanged: (value) {
                      tab1Link = value;
                    },
                  ),
                  SimpleTextField(
                      labelText: "Image Title",
                      onChanged: (value) {
                        tab1Title = value;
                      }),
                  SimpleTextField(
                      labelText: "Details - Be Descriptive",
                      onChanged: (value) {
                        tab1Details = value;
                      }),
                  SimpleTextField(
                      labelText: "Your moments related to it (keep it short)",
                      onChanged: (value) {
                        tab1Moments = value;
                      }),
                  Divider(),
                  Text('TAB 2'),
                  SimpleTextField(
                      labelText: "Image Link",
                      onChanged: (value) {
                        tab2Link = value;
                      }),
                  SimpleTextField(
                      labelText: "Image Title",
                      onChanged: (value) {
                        tab2Title = value;
                      }),
                  SimpleTextField(
                      labelText: "Details - Be Descriptive",
                      onChanged: (value) {
                        tab2Details = value;
                      }),
                  SimpleTextField(
                      labelText: "Your moments related to it (keep it short)",
                      onChanged: (value) {
                        tab2Moments = value;
                      }),
                  Divider(),
                  Text('Tab 3'),
                  SimpleTextField(
                      labelText: "Image Link",
                      onChanged: (value) {
                        tab3Link = value;
                      }),
                  SimpleTextField(
                      labelText: "Image Title",
                      onChanged: (value) {
                        tab3Title = value;
                      }),
                  SimpleTextField(
                      labelText: "Details - Be Descriptive",
                      onChanged: (value) {
                        tab3Details = value;
                      }),
                  SimpleTextField(
                      labelText: "Your moments related to it (keep it short)",
                      onChanged: (value) {
                        tab3Moments = value;
                      }),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      event: event,
                                      date: date,
                                      oneLiner: oneLiner,
                                      tab1Details: tab1Details,
                                      tab1Link: tab1Link,
                                      tab1Moments: tab1Moments,
                                      tab1Title: tab1Title,
                                      tab2Details: tab2Details,
                                      tab2Link: tab2Link,
                                      tab2Moments: tab2Moments,
                                      tab2Title: tab2Title,
                                      tab3Details: tab3Details,
                                      tab3Link: tab3Link,
                                      tab3Moments: tab3Moments,
                                      tab3Title: tab3Title,
                                    )));
                      },
                      child: Text('Done')),
                ],
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleTextField extends StatefulWidget {
  const SimpleTextField({
    this.onChanged,
    this.textEditingController,
    this.autofillHints,
    this.textInputType,
    this.autoFocus = false,
    this.obscureText = false,
    this.textInputAction,
    this.focusNode,
    this.prefixIconData,
    this.hintText,
    this.labelText,
    this.errorText,
    this.helperText,
    this.showLabelAboveTextField = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.fillColor,
    this.accentColor,
    this.textColor = Colors.black,
    this.borderRadius = 6,
    this.validator,
    this.showConfirmation = true,
    this.showError = true,
    this.verticalPadding = 20,
    this.horizontalPadding = 12,
  });

  final Function(String) onChanged;
  final TextEditingController textEditingController;
  final Iterable<String> autofillHints;
  final TextInputType textInputType;
  final bool autoFocus;
  final bool obscureText;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final IconData prefixIconData;
  final String hintText;
  final String labelText;
  final String errorText;

  /// Text placed below the text field
  final String helperText;
  final bool showLabelAboveTextField;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color fillColor;
  final Color accentColor;
  final Color textColor;
  final double borderRadius;
  final bool Function(String) validator;
  final bool showConfirmation;
  final bool showError;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  FocusNode focusNode;
  TextEditingController textEditingController;
  bool hasConfirmation;
  bool hasError;
  bool hasFocus;

  @override
  void initState() {
    super.initState();
    hasFocus = false;
    textEditingController = widget.textEditingController != null
        ? widget.textEditingController
        : TextEditingController();
    hasConfirmation = textEditingController.text != null ? isValid : false;
    hasError = textEditingController != null ? !isValid : false;
    focusNode = widget.focusNode != null ? widget.focusNode : FocusNode();

    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasPrimaryFocus;
        bool valid = isValid;
        hasConfirmation = valid;
        hasError = !valid;
      });
    });
  }

  bool get isValid {
    if (hasValidator) {
      return widget.validator(textEditingController.text);
    }
    return false;
  }

  bool get hasValidator {
    return widget.validator != null;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    OutlineInputBorder buildFocusedBorder() {
      if (hasValidator) {
        if (hasConfirmation && widget.showConfirmation) {
          return OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.25),
              borderRadius: BorderRadius.circular(widget.borderRadius));
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.25),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderSide: BorderSide(
            color: widget.accentColor ?? currentTheme.primaryColor,
            width: 1.25),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
    }

    OutlineInputBorder buildEnabledBorder() {
      if (hasValidator) {
        if (hasConfirmation) {
          return OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: Colors.grey[400],
        ),
      );
    }

    TextStyle buildLabelStyle() {
      if (hasFocus) {
        return TextStyle(color: widget.accentColor);
      } else {
        return null;
      }
    }

    Icon buildSuffixIcon() {
      if (hasValidator) {
        if (hasConfirmation) {
          return Icon(Icons.check, color: Colors.green);
        } else if (hasError) {
          return Icon(
            Icons.error,
            color: Colors.red,
            size: 24,
          );
        }
      }
      return null;
    }

    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor: widget.accentColor?.withOpacity(.33) ??
            currentTheme.primaryColor.withOpacity(.33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null && widget.showLabelAboveTextField) ...[
            Text(
              widget.labelText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 6),
          ],
          TextField(
            focusNode: focusNode,
            controller: textEditingController,
            autofillHints: widget.autofillHints,
            keyboardType: widget.textInputType,
            autofocus: widget.autoFocus,
            onChanged: (val) {
              setState(() {
                hasError = false;
                hasConfirmation = isValid;
              });
              if (widget.onChanged != null) {
                widget.onChanged(val);
              }
            },
            style: TextStyle(color: widget.textColor),
            cursorColor: widget.textColor,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding),
              isDense: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: widget.textColor.withOpacity(.45)),
              labelText:
                  widget.showLabelAboveTextField ? null : widget.labelText,
              labelStyle: buildLabelStyle(),
              errorText: widget.errorText != null && hasError && hasValidator
                  ? widget.errorText
                  : null,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              fillColor: widget.fillColor,
              filled: widget.fillColor != null,
              focusedBorder: buildFocusedBorder(),
              enabledBorder: buildEnabledBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              prefixIcon: widget.prefixIconData != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: Icon(
                        widget.prefixIconData,
                        color: hasFocus
                            ? widget.accentColor
                            : widget.textColor.withOpacity(.6),
                        size: 20,
                      ),
                    )
                  : null,
              prefixIconConstraints:
                  BoxConstraints(minHeight: 24, minWidth: 24),
              suffixIcon: buildSuffixIcon(),
            ),
          ),
          if (widget.helperText != null) ...[
            SizedBox(height: 6),
            Text(
              widget.helperText,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ]
        ],
      ),
    );
  }
}

// Util

// Copied from https://github.com/modulovalue/dart_intersperse/blob/master/lib/src/intersperse.dart
/// Puts [element] between every element in [list].
Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton({
    this.child,
    this.color,
    this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
  });
  final Color color;
  final Widget child;
  final Function onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
