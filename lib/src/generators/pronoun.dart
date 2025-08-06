import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:meta/meta.dart';
import 'package:sanctuary_queer_faker/src/sanctuary_queer_faker_base.dart'
    show QueerFaker;

/// A generator for pronoun sets.
class Pronoun {
  final SanctuaryVocabulary _vocabulary;

  /// Creates a [Pronoun] generator.
  @internal
  Pronoun(this._vocabulary);

  /// Returns a random `PronounSet` object from the vocabulary's unified list.
  ///
  /// This is more powerful than returning a string, as the developer
  /// can access individual pronouns (e.g., .subjective, .objective).
  PronounSet any(QueerFaker faker) {
    return faker.randomElement(_vocabulary.pronouns.all());
  }
}
