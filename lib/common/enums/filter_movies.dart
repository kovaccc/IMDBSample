import '../../generated/l10n.dart';
import '../../ui/resources/routes.dart';

enum FilterMovies { popular, favourite }

extension FilterExtension on FilterMovies {
  String getQueryTabPath() {
    switch (this) {
      case FilterMovies.popular:
        return '$homePagePath${S.current.queryTab(getTitle())}';
      case FilterMovies.favourite:
        return '$homePagePath${S.current.queryTab(getTitle())}';
    }
  }

  String getTitle() {
    switch (this) {
      case FilterMovies.popular:
        return S.current.popular;
      case FilterMovies.favourite:
        return S.current.favourites;
    }
  }
}
