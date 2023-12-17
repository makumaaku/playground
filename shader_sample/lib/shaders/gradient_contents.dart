import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class GradientContents extends StatelessWidget {
  const GradientContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientFrame();
  }
}

final class GradientFrame extends StatelessWidget {
  const GradientFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/gradient.frag',
      (_, shader, __) => AnimatedSampler(
        (_, size, canvas) {
          // 変数の受け渡し。
          // 順番通りに入れていくことになるので、順序の変更には要注意
          shader.setFloatUniforms((uniforms) {
            uniforms
              ..setFloat(size.width)
              ..setFloat(size.height);
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
