import 'package:notus_format/notus_format.dart';
import 'package:test/test.dart';

NotusDocument dartconfDoc() {
  return NotusDocument()..insert(0, 'DartConf\nLos Angeles');
}

final ul = NotusAttribute.ul.toJson();
final h1 = NotusAttribute.h1.toJson();

void main() {
  group('$NotusHeuristics', () {
    test('ensures heuristics are applied', () {
      final doc = dartconfDoc();
      final heuristics = NotusHeuristics(
        formatRules: [],
        insertRules: [],
        deleteRules: [],
      );

      expect(() {
        heuristics.applyInsertRules(doc, 0, 'a');
      }, throwsStateError);

      expect(() {
        heuristics.applyDeleteRules(doc, 0, 1);
      }, throwsStateError);

      expect(() {
        heuristics.applyFormatRules(doc, 0, 1, NotusAttribute.bold);
      }, throwsStateError);
    });
  });
}
