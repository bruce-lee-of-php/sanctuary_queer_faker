import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:sanctuary_queer_faker/src/queer_faker_base.dart';
import 'package:meta/meta.dart';

/// A generator for gender identities.
class Gender {
  final SanctuaryVocabulary _vocabulary;

  /// Creates a [Gender] generator.
  @internal
  Gender(this._vocabulary);

  /// Returns a random gender identity string.
  String identity(QueerFaker faker) {
    // 1. Fetch the entire list of identities from the core package.
    final allGenders =
        _vocabulary.genders.all(); // Assumes a .all() method exists

    // 2. Use the faker's internal, seeded random generator to pick one.
    return faker.randomElement(allGenders);
  }
}
