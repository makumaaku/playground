import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class HelloWorldContents extends StatelessWidget {
  const HelloWorldContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelloWorldFrame();
  }
}

final class HelloWorldFrame extends StatelessWidget {
  const HelloWorldFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/helloworld.frag',
      (_, shader, __) => AnimatedSampler(
        (_, size, canvas) {
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
