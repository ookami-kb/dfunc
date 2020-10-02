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
