import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class StripeTimeScaleFrame extends StatefulWidget {
  const StripeTimeScaleFrame({super.key});

  @override
  State<StripeTimeScaleFrame> createState() => _StripeTimeScaleFrameState();
}

class _StripeTimeScaleFrameState extends State<StripeTimeScaleFrame>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  Duration _currentTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      setState(() {
        _currentTime = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/stripe_time_scale.frag',
      (_, shader, __) => AnimatedSampler(
        (_, size, canvas) {
          // 変数の受け渡し。
          // 順番通りに入れていくことになるので、順序の変更には要注意
          shader.setFloatUniforms((uniforms) {
            uniforms
              ..setFloat(size.width)
              ..setFloat(size.height)
              ..setFloat(_currentTime.inMilliseconds.toDouble());
          });

          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: Container(),
      ),
    );
  }
}
