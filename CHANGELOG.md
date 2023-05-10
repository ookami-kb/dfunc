## 0.9.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: migrate to Dart 3 (#25).

## 0.8.2

 - **REFACTOR**: bump `mews_pedantic` (#24).
 - **FEAT**: add `beforeFirst` and `afterLast` to `intersperse(With)` (#23).
 - **FEAT**: add `maybeWhereType` (#22).

## 0.8.1

 - **FEAT**: add Iterable<Result<T>>.sequence() (#19).

## 0.8.0+1

 - **FIX**: Export Iterable extensions (#18).
 - **FIX**: Export Transformer.

## 0.8.0

> Note: This release has breaking changes.

 - **REFACTOR**: Update to mews_pedantic 0.6.0.
 - **FIX**: Update optional constraints, add docs.
 - **FEAT**: Add intersperseWith.
 - **FEAT**: Add Either shortcuts (#16).
 - **FEAT**: Add optional utilities (#14).
 - **FEAT**: Add String extensions.
 - **FEAT**: Add `ifNull`.
 - **DOCS**: Add codecov badge.
 - **BREAKING** **REFACTOR**: Migrate to Object.hash (#15).

## 0.7.2

 - **FEAT**: Add `doOn*` extensions.
 - **FEAT**: Add `flatMapLeftAsync`.

## 0.7.1

 - **FEAT**: Add cast functions.
 - **CHORE**: publish packages.
 - **CHORE**: publish packages.

## 0.7.0

> Note: This release has breaking changes.

 - **REFACTOR**: Use relative imports.
 - **DOCS**: Update README.md.
 - **DOCS**: Update docs.
 - **CI**: Switch to setup-dart action (#7).
 - **CHORE**: Add pub.dev badge.
 - **BREAKING** **FEAT**: Add typedefs.

## 0.6.2

 - **FEAT**: Add compact.
 - **DOCS**: Revert readme to markdown.

## 0.6.1

 - **FEAT**: Add tryEither methods.
 - **DOCS**: Update readme.
 - **CI**: Update workflow.
 - **CI**: Add melos.
 - **CHORE**: Update dependencies.

## 0.6.0
- Migrate to stable null safety

## 0.6.0-nullsafety.2
- Fixed nullability issues, switched to mews_pedantic rules

## 0.6.0-nullsafety.1
- Enabled null safety

## 0.5.2

- :zap: Add Either::mapLeft/mapLeftAsync.
- :boom: Make Either::left and Either::right private.
- :cop: Refactor tests

## 0.5.1+1

- Fixed Coproduct10 branching

## 0.5.1

- Switched off NNBD for 0.5

## 0.5.0

- Migrated to Dart 1.10 and enabled NNBD
- Added `traverse` functions
- Removed `ifNotNull` (use `let` instead)

## 0.4.7

- Added `Future<Optional<T>>::foldAsync`, `Stream<Optional<T>>::mapFold`
- Added `Stream<Either<L, R>>::mapFold`

## 0.4.6

- Added `let` and `also` functions.

## 0.4.5

- Added groupBy function

## 0.4.4

- Fixed `toCoproductString` method

## 0.4.3

- Added partial application and currying
- Added Coproduct up to 10

## 0.4.2+1

- Fixed Coproduct::fold

## 0.4.2

- Added Coproduct6

## 0.4.1

- Added Coproduct::toString

## 0.4.0

- Simplified API, removed sealed. A lot of breaking changes!

## 0.3.6

- Added zip2 and zipWith functions

## 0.3.5

- Added extensions
- Added Coproduct up to Coproduct10

## 0.3.4

- Updated README.

## 0.3.3

- Added some examples.

## 0.3.2

- Added @sealed annotation

## 0.3.1

- Added Sealed annotation

## 0.3.0

- Either now throws StateError for wrong branch
- Added const constructors to Either and Optional
- Added == for Either

## 0.2.1

- Exported Eithers functions

## 0.2.0

- Added Eithers::combine*
- Renamed Either::combine2 to Either::combine

## 0.1.11

- Fixed dependencies
- Fix analyzer issues

## 0.1.10

- Added Product type
- Added Coproduct type
- Added Either::combine2 function

## 0.1.9

- Added Optional::where function

## 0.1.8

- Exported Optional

## 0.1.7

- Added toOptional() extension method

## 0.1.6

- Added Optional

## 0.1.5

- Fixed error in Future<Either> extension functions

## 0.1.4

- Added Future<Either>::map function
- FutureEitherExtension functions parameters now return FutureOr

## 0.1.3

- Added Either::mapAsync function

## 0.1.2

- Added Either::map function

## 0.1.1

- Added Either extensions

## 0.1.0

- Depends on Dart 2.6.0
- Added Either

## 0.0.7

- Make sum func generic
- Added pipe functions

## 0.0.6

- Added functions:
    - ignore
    - always
    - T
    - F
    - substring
    - limit

## 0.0.5

- Added functions:
    - map
    - complement
    - isEmpty

## 0.0.4

- Updated description

## 0.0.3

- Updated documentation
- Added tests

## 0.0.2

- Initial version
