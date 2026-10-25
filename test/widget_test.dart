import 'package:flutter_test/flutter_test.dart';
import 'package:meu_primeiro_app/ritmo_app.dart';

void main() {
  testWidgets('Onboarding mostra o texto de boas-vindas', (WidgetTester tester) async {
    await tester.pumpWidget(const RitmoApp());

    expect(find.text('Bem-vindo ao Ritmo Único!'), findsOneWidget);
  });
}