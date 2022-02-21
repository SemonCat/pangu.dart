Pangu.Dart
==========

Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean), half-width English, digit and symbol characters.

## Homepage

[https://pub.dartlang.org/packages/pangu](https://pub.dartlang.org/packages/pangu)

## Download

```
dependencies:
  pangu: ^1.1.0
```

## Usage

```dart
String text = Pangu().spacingText("當你凝視著bug，bug也凝視著你");
```

or

```dart
String text = Pangu.spacingText("當你凝視著bug，bug也凝視著你");
```
