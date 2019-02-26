import '../main.dart';

import 'dart:html';
import 'dart:math';

const int CELL_SIZE = 10;

void drawCell(Point coords, String color) {  
  ctx..fillStyle = color
    ..strokeStyle = "white";

  final int x = coords.x * CELL_SIZE;
  final int y = coords.y * CELL_SIZE;

  ctx..fillRect(x, y, CELL_SIZE, CELL_SIZE)
    ..strokeRect(x, y, CELL_SIZE, CELL_SIZE);
}

void clear() {  
  ctx..fillStyle = "white"
    ..fillRect(0, 0, canvas.width, canvas.height);
}