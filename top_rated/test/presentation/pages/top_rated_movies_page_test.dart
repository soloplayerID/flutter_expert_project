import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toprated/presentation/bloc/top_rated_movies_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toprated/presentation/pages/top_rated_movies_page.dart';

import '../../dummy_data/dummy_objects.dart';

class FakeTopRatedMovieEvent extends Fake implements TopRatedMovieEvent {}

class FakeTopRatedState extends Fake implements TopRatedMovieState {}

class MockTopRatedMovieBloc extends MockBloc<TopRatedMovieEvent, TopRatedMovieState>
    implements TopRatedMoviesBloc {}

void main() {
  late MockTopRatedMovieBloc mockTopRatedMovieBloc;

  setUpAll(() {
    registerFallbackValue(FakeTopRatedState());
    registerFallbackValue(FakeTopRatedMovieEvent());
    mockTopRatedMovieBloc = MockTopRatedMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMoviesBloc>.value(
      value: mockTopRatedMovieBloc,
      child: MaterialApp(
          home: body,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case MOVIE_DETAIL_ROUTE:
                return MaterialPageRoute(
                  builder: (_) => Container(),
                  settings: settings,
                );
            }
          }),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTopRatedMovieBloc.state).thenReturn(TopRatedMovieLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTopRatedMovieBloc.state).thenReturn(TopRatedMovieHasData([testMovie]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTopRatedMovieBloc.state)
        .thenReturn(TopRatedMovieError('Error message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Page should display movie card when data loaded',
      (WidgetTester tester) async {
    when(() => mockTopRatedMovieBloc.state).thenReturn(TopRatedMovieHasData([testMovie]));

    final movieCardFinder = find.byType(MovieCard);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(movieCardFinder, findsOneWidget);
  });

  testWidgets('onTap Movie card from popular movies page',
      (WidgetTester tester) async {
    when(() => mockTopRatedMovieBloc.state).thenReturn(TopRatedMovieHasData([testMovie]));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    final movieCardFinder = find.byKey(Key('movieCard'));

    expect(movieCardFinder, findsOneWidget);

    await tester.tap(movieCardFinder);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.byKey(Key('movieCard')), findsNothing);
  });
}
