import 'package:commit_formatter/commit_formatter.dart';
import 'package:test/test.dart';

void main() {
  final commitlintFormatter = CommitlintFormatter();

  group('class CommitlintFormatter { ... }', () {
    test('Basic feature - Fix Type', () {
      expect(
        commitlintFormatter.formatThis('Fix,Backend,Closes Issue #40'),
        '${CommitlintFormatter.emojis["FIX"]} Fix(Backend): Closes issue #40',
      );
    });
    test('Basic feature - Test Type', () {
      expect(
        commitlintFormatter.formatThis('test, Backend , Add tests for core'),
        '''${CommitlintFormatter.emojis["TEST"]} Test(Backend): Add tests for core''',
      );
    });
    test('Basic feature - Invalid Test Type', () {
      expect(
        () => commitlintFormatter
            .formatThis('tests, Backend , Add tests for core'),
        throwsA(isA<InvalidCommitTypeException>()),
      );
    });
    test('Throws Invalid Type when a invalid type is provided', () {
      void _throwInvalidType() {
        commitlintFormatter.formatThis('Tests,Backend,Closes Issue #40');
      }

      expect(
        _throwInvalidType,
        throwsA(isA<InvalidCommitTypeException>()),
      );
    });
  });
}
