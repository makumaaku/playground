import 'package:flutter/material.dart';
import 'package:shader_sample/shaders/gradient_frame.dart';
import 'package:shader_sample/shaders/hello_world_frame.dart';
import 'package:shader_sample/shaders/pixelation_frame.dart';
import 'package:shader_sample/shaders/stripe_frame.dart';
import 'package:shader_sample/shaders/stripe_time_scale_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShaderScreen(),
    );
  }
}

class ShaderScreen extends StatefulWidget {
  const ShaderScreen({super.key});

  @override
  State<ShaderScreen> createState() => _ShaderScreenState();
}

class _ShaderScreenState extends State<ShaderScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final shaderContents = [
    const PixelationContents(),
    const HelloWorldFrame(),
    const GradientFrame(),
    const StripeFrame(),
    const StripeTimeScaleFrame(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: PageView.builder(
          controller: _pageController,
          itemCount: shaderContents.length,
          itemBuilder: (_, index) {
            return shaderContents[index];
          },
        ));
  }
}
