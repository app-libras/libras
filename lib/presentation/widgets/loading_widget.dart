import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logos/sign.png', height: 150),
          const SizedBox(height: 20),
          AnimatedTextKit(
            repeatForever: false,
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 200),
            animatedTexts: [
              TypewriterAnimatedText(
                'LiBRAR',
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
