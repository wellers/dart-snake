import 'inc/common.dart';
import 'inc/keyboard.dart';
import 'inc/game.dart';

import 'dart:html';
import 'dart:math';

CanvasElement canvas;  
CanvasRenderingContext2D ctx;
Keyboard keyboard = new Keyboard();

void main() {  
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');
  drawCell(new Point(10, 10), "salmon");

  new Game()..run();
}
