import 'dart:math';
import 'package:meta/meta.dart';
import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

import 'package:sanctuary_queer_faker/src/generators/gender.dart';
import 'package:sanctuary_queer_faker/src/generators/pronoun.dart';
import 'package:sanctuary_queer_faker/src/generators/sexuality.dart';

/// The main class for generating queer-inclusive data.
class QueerFaker {
  final Random _random;

  /// An instance of the vocabulary provider from your core package.
  @internal
  final SanctuaryVocabulary vocabulary;

  /// A generator for pronoun sets.
  final Pronoun pronoun;

  /// A generator for gender identities.
  final Gender gender;

  /// A generator for sexual orientations.
  final Sexuality sexuality;

  /// Creates an instance of [QueerFaker].
  ///
  /// This factory constructor sets up the necessary `SanctuaryVocabulary` instance
  /// and passes it to a private constructor to properly initialize the final fields.
  factory QueerFaker({int? seed}) {
    // Create the single vocabulary instance here.
    final vocabInstance = SanctuaryVocabulary();
    // Pass it to the private constructor.
    return QueerFaker._internal(
      seed: seed,
      vocabulary: vocabInstance,
    );
  }

  /// Private constructor for internal use by the factory.
  QueerFaker._internal({int? seed, required this.vocabulary})
      // Now we can correctly initialize the generators with the vocabulary instance.
      : _random = Random(seed),
        pronoun = Pronoun(vocabulary),
        gender = Gender(vocabulary),
        sexuality = Sexuality(vocabulary);

  /// A utility method to get a random element from a list.
  /// This is used internally by the generators.
  @internal
  T randomElement<T>(List<T> list) {
    if (list.isEmpty) {
      throw Exception(
          'The data list from SanctuaryVocabulary is empty. Check your core package data.');
    }
    return list[_random.nextInt(list.length)];
  }
}
