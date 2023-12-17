import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class PixelationContents extends StatelessWidget {
  const PixelationContents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.network('https://placehold.jp/300x200.png'),
            const SizedBox(height: 20),
            const PixelationFrame(pixelCount: 80),
            const SizedBox(height: 20),
            const PixelationFrame(pixelCount: 40),
          ],
        ),
      ),
    );
  }
}

final class PixelationFrame extends StatelessWidget {
  const PixelationFrame({super.key, this.pixelCount = 50.0});

  final double pixelCount;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/pixelation.frag',
      (context, shader, child) => AnimatedSampler(
        (image, size, canvas) {
          shader.setFloatUniforms((uniforms) {
            uniforms
              ..setSize(size)
              ..setFloat(pixelCount);
          });
          shader.setImageSampler(0, image);
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: Image.network('https://placehold.jp/300x200.png'),
      ),
    );
  }
}
