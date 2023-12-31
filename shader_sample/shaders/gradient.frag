#version 460 core
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// 解像度を格納する変数
uniform vec2 resolution;

void main() {
   vec2 pos = FlutterFragCoord().xy / resolution;
   fragColor = vec4(pos.x, pos.y, 0.0, 1.0);
}