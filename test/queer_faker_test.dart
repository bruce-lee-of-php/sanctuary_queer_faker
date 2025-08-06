import 'package:test/test.dart';
import 'package:collection/collection.dart'; // Import for list comparison
import 'package:sanctuary_queer_faker/src/sanctuary_queer_faker_base.dart';

void main() {
  group('QueerFaker', () {
    test('generates different results by default (no seed)', () {
      final faker1 = QueerFaker();
      final faker2 = QueerFaker();

      // To avoid flaky tests from random collisions on a single generation,
      // we generate a list of values. The chance of two unseeded Random
      // instances producing the exact same sequence of 10 values is
      // astronomically low.
      final genders1 = List.generate(10, (_) => faker1.gender.identity(faker1));
      final genders2 = List.generate(10, (_) => faker2.gender.identity(faker2));

      final pronouns1 =
          List.generate(10, (_) => faker1.pronoun.any(faker1).subjective);
      final pronouns2 =
          List.generate(10, (_) => faker2.pronoun.any(faker2).subjective);

      final sexualities1 =
          List.generate(10, (_) => faker1.sexuality.orientation(faker1));
      final sexualities2 =
          List.generate(10, (_) => faker2.sexuality.orientation(faker2));

      // Use a collection equality matcher to ensure the lists are not identical.
      final listEquals = const ListEquality().equals;
      expect(listEquals(genders1, genders2), isFalse);
      expect(listEquals(pronouns1, pronouns2), isFalse);
      expect(listEquals(sexualities1, sexualities2), isFalse);
    });

    test('generates deterministic results when a seed is provided', () {
      // --- ARRANGE ---
      // Define a single seed to be used for both instances.
      const seed = 12345;
      final faker1 = QueerFaker(seed: seed);
      final faker2 = QueerFaker(seed: seed);

      // --- ACT ---
      // Generate a value from each generator for both instances.
      final gender1 = faker1.gender.identity(faker1);
      final gender2 = faker2.gender.identity(faker2);

      final pronoun1 = faker1.pronoun.any(faker1);
      final pronoun2 = faker2.pronoun.any(faker2);

      final sexuality1 = faker1.sexuality.orientation(faker1);
      final sexuality2 = faker2.sexuality.orientation(faker2);

      // --- ASSERT ---
      // 1. Assert that the results from the two seeded instances are identical.
      expect(gender1, equals(gender2));
      expect(pronoun1.subjective, equals(pronoun2.subjective));
      expect(sexuality1, equals(sexuality2));

      // 2. Assert that the results match the specific, expected deterministic output.
      //    (These expected values are what you get from the first run with seed 12345).
      expect(gender1, 'Trans Woman');
      expect(pronoun1.subjective, 'they');
      expect(sexuality1, 'Lesbian');
    });

    test('generates different sequences for different seeds', () {
      final faker1 = QueerFaker(seed: 1);
      final faker2 = QueerFaker(seed: 2);

      // Assert that different seeds produce different results.
      expect(faker1.gender.identity(faker1),
          isNot(equals(faker2.gender.identity(faker2))));
      expect(faker1.pronoun.any(faker1).subjective,
          isNot(equals(faker2.pronoun.any(faker2).subjective)));
    });
  });
}
