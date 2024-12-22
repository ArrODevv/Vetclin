import 'package:flutter/material.dart';

class BetterElevatedButton extends StatefulWidget {
  const BetterElevatedButton({
    super.key, required this.onPressed,
    this.onLongPress, this.disabled = false,
    this.style, this.autofocus = false,
    this.clipBehaviour, this.focusNode,
    this.onFocusChange, this.onHover,
    this.statesController,
    required this.child
  });
  
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool? disabled;
  final ButtonStyle? style;
  final bool autofocus;
  final Clip? clipBehaviour;
  final FocusNode? focusNode;
  final void Function(bool)? onFocusChange;
  final void Function(bool)? onHover;
  final WidgetStatesController? statesController;
  final Widget? child;
  
  @override
  State<BetterElevatedButton> createState() => _BetterElevatedButtonState();
}

class _BetterElevatedButtonState extends State<BetterElevatedButton> {
  @override
  Widget build(BuildContext context) {
    VoidCallback? onPressedCallback;
    
    if(widget.disabled == null || widget.disabled == true) {
      onPressedCallback = null;
    } else {
      onPressedCallback = widget.onPressed ?? () {};
    }
    
    VoidCallback? onLongPressCallback;
    
    if(widget.disabled == null || widget.disabled == true) {
      onLongPressCallback = null;
    } else {
      onLongPressCallback = widget.onLongPress ?? () {};
    }
    
    return ElevatedButton(
      key: widget.key,
      onPressed: onPressedCallback,
      onLongPress: onLongPressCallback,
      style: widget.style,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehaviour,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      statesController: widget.statesController,
      child: widget.child,
    );
  }
}
