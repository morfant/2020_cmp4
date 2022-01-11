class Bar {
  color barColor;
  float barWidth;
  float barHeight;

  Bar(int barW, int barH) {
    barColor = color(0);
    barWidth = barW;
    barHeight = barH;
  }

  void bar_display() {
    fill(barColor);
    rect(mouseX, height-50, barWidth, barHeight);
  }
}
