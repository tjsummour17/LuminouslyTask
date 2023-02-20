import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.colorScheme.surface.withOpacity(0.3);
    return ColoredBox(
      color: color,
      child: Center(
        child: context.theme.platform == TargetPlatform.iOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}
