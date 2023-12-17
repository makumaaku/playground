#version 460 core
#include <flutter/runtime_effect.glsl>

// 定数定義
#define PI 3.14159265359
#define SCALE_FACTOR 8

out vec4 fragColor;
uniform vec2 resolution;

// cosの値が -1 ~ 1までの変化であり、rgbaにマイナスの概念はないので正の値に変換する
float normalizeTrigonometricFunction(float value) {
   return (value + 1) / 2;
}

void main() {
   vec2 pos = FlutterFragCoord().xy / resolution;
   // cosのラジアン部分が x:0 -> 1に応じて、8π -> 0に変化する。つまり4周期分。
   // 赤->黒の変化が4回発生する。
   float redStripe = normalizeTrigonometricFunction(cos(pos.x * PI * SCALE_FACTOR));
   // green,blueも
   float greenStripe = normalizeTrigonometricFunction(sin(pos.y * PI * SCALE_FACTOR));
   float blueStripe = normalizeTrigonometricFunction(cos(pos.x * PI * SCALE_FACTOR));
   fragColor = vec4(redStripe, greenStripe,blueStripe, 1.0);
}