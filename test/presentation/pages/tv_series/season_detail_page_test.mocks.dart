// Mocks generated by Mockito 5.0.8 from annotations
// in ditonton/test/presentation/pages/tvseries/season_detail_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:ditonton/common/state_enum.dart' as _i5;
import 'package:ditonton/domain/entities/season_detail.dart' as _i3;
import 'package:ditonton/domain/usecases/tv/get_season_detail.dart'
    as _i2;
import 'package:ditonton/presentation/provider/tv/season_detail_notifier.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeGetSeasonDetail extends _i1.Fake implements _i2.GetSeasonDetail {}

class _FakeSeasonDetail extends _i1.Fake implements _i3.SeasonDetail {}

/// A class which mocks [SeasonDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeasonDetailNotifier extends _i1.Mock
    implements _i4.SeasonDetailNotifier {
  MockSeasonDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetSeasonDetail get getSeasonDetail =>
      (super.noSuchMethod(Invocation.getter(#getSeasonDetail),
          returnValue: _FakeGetSeasonDetail()) as _i2.GetSeasonDetail);
  @override
  _i3.SeasonDetail get season => (super.noSuchMethod(Invocation.getter(#season),
      returnValue: _FakeSeasonDetail()) as _i3.SeasonDetail);
  @override
  _i5.RequestState get seasonState =>
      (super.noSuchMethod(Invocation.getter(#seasonState),
          returnValue: _i5.RequestState.Empty) as _i5.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i6.Future<void> fetchSeasonDetail(int? id, int? season) =>
      (super.noSuchMethod(Invocation.method(#fetchSeasonDetail, [id, season]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i6.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}