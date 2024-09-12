import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatefulWidget {
  LoadingWidget({super.key, this.width, this.height});
  double? width = 200.0;
  double? height = 200.0;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      //child: Lottie.asset('files/logo_loading_new.json', repeat: true),
      child: Lottie.asset('assets/images/loading.json',
          repeat: true, width: widget.width, height: widget.height),
    );
  }
}
