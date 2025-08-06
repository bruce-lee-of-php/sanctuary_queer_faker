# sanctuary_queer_faker

A Dart package for generating realistic and inclusive test data, with a focus on LGBTQ+ identities.

This package helps you test your apps with a more representative set of user data, making it easier to build UIs and logic that respect and reflect the diversity of your users.

## Features
Generate pronouns, gender identities, and sexual orientations.

Simple, intuitive API.

Powered by the community-sourced data in sanctuary_l10n_core.

## Getting started
Add the package to your dev_dependencies in pubspec.yaml:

dev_dependencies:
  sanctuary_queer_faker: ^0.1.0

### Usage
Import the package and create an instance of QueerFaker.

import 'package:sanctuary_queer_faker/sanctuary_queer_faker.dart';

void main() {
  // For repeatable tests, use a seed
  final faker = QueerFaker(seed: 123);

  // Generate a random gender identity
  final gender = faker.gender.identity();
  print(gender); // Possible output: "Agender"

  // Generate a random sexual orientation
  final sexuality = faker.sexuality.orientation();
  print(sexuality); // Possible output: "Lesbian"

  // Generate a pronoun set
  final pronounSet = faker.pronoun.any();

  // You can now use all parts of the pronoun set
  print(pronounSet.display);        // "they/them"
  print(pronounSet.subjective);     // "they"
}

## More Details
For Queer Devs, By Queer Devs
You know the drill. You're building a new feature, you need some test data, and every single data faker gives you a list of cishet-sounding names with no concept of chosen names, pronouns, or anything that reflects our actual community.

sanctuary_queer_faker is a data generation tool built to fix that. It's a simple, no-nonsense package for populating your tests and mockups with data that actually looks like the people we're building for. It's built on top of the sanctuary_l10n_core vocabulary, so the data is community-sourced and respectful.

### The API: What You Get
The goal is a simple and predictable API. Instantiate the faker and go.

QueerFaker Class

This is your main entry point.

Constructor: QueerFaker({int? seed})

seed: If you're writing tests that need to be repeatable (and you probably are), pass an int here. You'll get the same "random" data every time. Omit it for truly random data.

### Generators

You access the generators directly from your faker instance.

faker.pronoun

any() -> PronounSet: Gets a random pronoun set. Crucially, this returns the full PronounSet object from the core package, not just a string like "they/them". This means you can immediately access pronounSet.subjective, pronounSet.objective, etc., which is what you actually need for building sentences and UI.

faker.gender

identity() -> String: Returns a random gender identity (e.g., "Genderqueer").

faker.sexuality

orientation() -> String: Returns a random sexual orientation (e.g., "Bisexual").

### What You Can Do With It Now (v0.1)
Actually Test Your UI: Does your profile card break when a gender identity string is long? Can you build a sentence correctly using user.pronouns.reflexive? Now you can write a real test for it.

Seed Your Dev Database: Populate your local database with data that isn't just a sea of cishet defaults. This helps you catch bugs in filtering or display logic early.

Make Realistic Mocks: Give your designers and stakeholders mockups that use data reflecting a queer user base.

### What It's Not (Yet)
Let's be real, this is v0.1. Here's what it doesn't do:

It's Not a Profile Generator: This is the big one. It generates individual data points, not a whole, logically consistent person. It won't give you a chosenName that matches a legalName or ensure a user's pronouns align with their identity. That's the goal for the next major version.

No Names, No Other Demographics: It's laser-focused on queer identity data. It won't generate names, ages, etc. You'll need another faker library for that (for now).

No Grammar Engine Integration: It only uses the SanctuaryVocabulary from the core package. It can't generate full sentences.

No Localization: The QueerFaker class doesn't take a locale yet. It only uses the default English data from the core package.