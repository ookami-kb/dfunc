import 'package:build/build.dart';
import 'package:dfunc_builder/src/sealed/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder sealedBuilder(BuilderOptions options) =>
    SharedPartBuilder([SealedGenerator()], 'sealed');
