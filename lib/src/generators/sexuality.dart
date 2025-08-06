import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:sanctuary_queer_faker/src/queer_faker_base.dart';
import 'package:meta/meta.dart';

/// A generator for sexual orientations.
class Sexuality {
  final SanctuaryVocabulary _vocabulary;

  /// Creates a [Sexuality] generator.
  @internal
  Sexuality(this._vocabulary);

  /// Returns a random sexual orientation string.
  String orientation(QueerFaker faker) {
    // 1. Fetch the entire list of orientations.
    final allSexualities =
        _vocabulary.sexualities.all(); // Assumes a .all() method exists

    // 2. Use the faker's seeded random generator to pick one.
    return faker.randomElement(allSexualities);
  }
}
