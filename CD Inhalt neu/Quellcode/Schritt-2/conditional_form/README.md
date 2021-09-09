# conditional_form

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Build Value and .g.dart files

This project uses the package [built_value](https://pub.dev/packages/built_value).
A Package that generates serialisable immutable Value types.

Those types are found in lib/data.

They are generated using fluter run build_runner build or fluter run build_runner build

## postgres and authentication
This project uses the package [postgres](https://pub.dev/packages/postgres).

When using it with a local clean installation of postgres 13 it threw the error:
"Unable to connect to Postgress DB due to the authentication type 10 is not supported"

In order to make it work the guide in the answer of this [stackoverflow page](https://stackoverflow.com/questions/64210167/unable-to-connect-to-postgress-db-due-to-the-authentication-type-10-is-not-suppo)  was followed.

##

In order to understand the concepts please complete the following tutorials first:


[Get started](https://flutter.dev/docs/get-started).
[Navigation](https://flutter.dev/docs/cookbook/navigation).
[Forms](https://flutter.dev/docs/cookbook/forms).
[DataTable](Flutter Widget of the Week)](https://www.youtube.com/watch?v=ktTajqbhIcY).

Watch this video:
[Pragmatic State Management in Flutter (Google I/O'19)](https://www.youtube.com/watch?v=d_m5csmrf7I).

[https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative).
[Simple app state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).


