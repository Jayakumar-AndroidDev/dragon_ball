import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dragon_ball_app/provider/internet_state_provider.dart';
import 'package:dragon_ball_app/shared_widgets/network_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InternetFailPage extends ConsumerStatefulWidget {
  const InternetFailPage({
    super.key,
    required this.childWidget,
    required this.onSuccess,
    required this.onFailure,
  });

  final Widget childWidget;

  final Function() onSuccess;
  final Function() onFailure;

  @override
  ConsumerState<InternetFailPage> createState() => _InternetFailPageState();
}

class _InternetFailPageState extends ConsumerState<InternetFailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final internetStream = ref.watch(internetStreamProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: internetStream.when(
        data: (data) {
          if (data.isEmpty || data[0] == ConnectivityResult.none) {
           
            widget.onFailure();
            return Center(child: NetworkErrorWidget(onTap: () {}));
          } else { widget.onSuccess();
            return widget.childWidget;
          }
        },
        error: (error, stackTrace) => const SizedBox(),
        loading: () => const SizedBox(),
      ),
    );
  }
}
