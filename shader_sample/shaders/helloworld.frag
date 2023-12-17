// Open GLのバージョン指定
#version 460 core

// 使用する変数の指定
// カラーはrgbaの4つの変数からなるベクトル => vec4
// main関数内で使用するためにoutをつける
out vec4 fragColor;

void main() {
    // rgba
	fragColor = vec4(1, 0, 0, 1);
}