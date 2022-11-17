
import 'package:flutter_test/flutter_test.dart';
import 'package:best_flutter_ui_templates/fitness_app/calculator/ui_calaculator.dart';

void main() {
  test('IMC test', () {
    final calcular = CalculatorUI();

    calcular.calcular(7, 156.0);

    expect(calcular.imc, 23.0);

  });
}