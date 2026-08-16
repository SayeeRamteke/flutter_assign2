import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const CineVerseApp());
}

// ============================================================
// APP
// ============================================================

class CineVerseApp extends StatelessWidget {
  const CineVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineVerse',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09090D),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================
// MOVIE MODEL
// ============================================================

class Movie {
  final String title;
  final String genre;
  final String rating;
  final String year;
  final String posterUrl;
  final String trailerUrl;
  final String description;

  const Movie({
    required this.title,
    required this.genre,
    required this.rating,
    required this.year,
    required this.posterUrl,
    required this.trailerUrl,
    required this.description,
  });
}

// ============================================================
// MOVIE DATA
// ============================================================

const List<Movie> movies = [

  Movie(
    title: "Spider-Man: Brand New Day",
    genre: "Action",
    rating: "8.7",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/yyB2VJEW3an2xCdcYCPQhn9QERR.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Spider-Man+Brand+New+Day+official+trailer",
    description:
        "Peter Parker faces a new chapter as Spider-Man and a threat unlike anything he has faced before.",
  ),

  Movie(
    title: "The Odyssey",
    genre: "Adventure",
    rating: "9.1",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/5rhTDKUhPYvpdQIijFIs5VoWsON.jpg",
    trailerUrl:
        "https://www.youtube.com/watch?v=Mzw2ttJD2qQ",
    description:
        "Christopher Nolan's mythic epic follows Odysseus on a perilous journey home after the Trojan War.",
  ),

  Movie(
    title: "Obsession",
    genre: "Thriller",
    rating: "8.4",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/bRwnj8WEKBCvmfeUNOukJPwB43K.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Obsession+2026+official+trailer",
    description:
        "A psychological thriller where obsession begins to blur the line between desire and danger.",
  ),

  Movie(
    title: "Backrooms",
    genre: "Horror",
    rating: "8.2",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/rhGx6E3qRNMgj3i5su2oukNHwIQ.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Backrooms+2026+official+trailer",
    description:
        "A terrifying descent into an endless maze where escaping may be impossible.",
  ),

  Movie(
    title: "Leviticus",
    genre: "Horror",
    rating: "7.8",
    year: "2026",
    posterUrl:
        "https://www.impawards.com/2026/posters/leviticus.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Leviticus+2026+official+trailer",
    description:
        "Two teenage boys must escape a violent supernatural entity that takes the form of the person they desire most.",
  ),

  Movie(
    title: "Toy Story 5",
    genre: "Animation",
    rating: "8.3",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/pxG26JdyuiDvJbSoucknaFiLeZD.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Toy+Story+5+official+trailer",
    description:
        "Woody, Buzz and the gang return for another adventure.",
  ),

  Movie(
    title: "Supergirl",
    genre: "Action",
    rating: "8.0",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/niSvU02l2BONH9ivubV6K1a5QiK.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Supergirl+2026+official+trailer",
    description:
        "Kara Zor-El steps into a new chapter as one of DC's most powerful heroes.",
  ),

  Movie(
    title: "Evil Dead Burn",
    genre: "Horror",
    rating: "7.9",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/ztadKzIIR0ERYqpHteaPFtk7inP.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Evil+Dead+Burn+official+trailer",
    description:
        "A terrifying supernatural nightmare brings the Deadites back.",
  ),

  Movie(
    title: "The End of Oak Street",
    genre: "Thriller",
    rating: "7.7",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/dQgIcW6Th08kMRf2HBoYWoFE6OD.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=The+End+of+Oak+Street+official+trailer",
    description:
        "A mysterious story unfolds as ordinary life on Oak Street begins to fall apart.",
  ),

  Movie(
    title: "The Dog Stars",
    genre: "Sci-Fi",
    rating: "8.1",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/yihdXomYb5kTeSivtFndMy5iDmf.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=The+Dog+Stars+2026+official+trailer",
    description:
        "A post-apocalyptic science-fiction story about survival, companionship and hope.",
  ),

  Movie(
    title: "Project Hail Mary",
    genre: "Sci-Fi",
    rating: "8.6",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/yihdXomYb5kTeSivtFndMy5iDmf.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Project+Hail+Mary+official+trailer",
    description:
        "A lone astronaut awakens millions of miles from Earth with a mission to save humanity.",
  ),

  Movie(
    title: "Mortal Kombat II",
    genre: "Action",
    rating: "8.0",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/hwRdDFIhaEmpRgoki805YvyyjZf.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Mortal+Kombat+II+official+trailer",
    description:
        "The warriors of Earthrealm return for another brutal battle.",
  ),

  Movie(
    title: "The Devil Wears Prada 2",
    genre: "Drama",
    rating: "8.2",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/fCAURTUx3YfsJ8k9I0UamjSILiR.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Devil+Wears+Prada+2+official+trailer",
    description:
        "Miranda Priestly returns as the fashion world enters a new era.",
  ),

  Movie(
    title: "Minions & Monsters",
    genre: "Animation",
    rating: "7.9",
    year: "2026",
    posterUrl:
        "https://image.tmdb.org/t/p/w500/nz7i42yhLIJ4ve9JKgM6NthoLHO.jpg",
    trailerUrl:
        "https://www.youtube.com/results?search_query=Minions+and+Monsters+2026+trailer",
    description:
        "The Minions find themselves facing a hilarious monster-sized problem.",
  ),
];

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late YoutubePlayerController youtubeController;

  String selectedGenre = "All";

  int selectedTab = 0;
  bool showTrailer = false;

  final Set<String> bookmarkedMovies = {};

  final ScrollController genreScrollController = ScrollController();
  final ScrollController movieRowScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    youtubeController = YoutubePlayerController.fromVideoId(
      videoId: "Mzw2ttJD2qQ",
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    youtubeController.close();
    genreScrollController.dispose();
    movieRowScrollController.dispose();
    super.dispose();
  }

  // ==========================================================
  // FILTER MOVIES
  // ==========================================================

  List<Movie> get filteredMovies {
    List<Movie> result = movies;

    if (selectedTab == 2) {
      result = movies
          .where((movie) => bookmarkedMovies.contains(movie.title))
          .toList();
    }

    if (selectedGenre != "All" && selectedTab == 0) {
      result = result
          .where((movie) => movie.genre == selectedGenre)
          .toList();
    }

    return result;
  }

  // ==========================================================
  // OPEN URL
  // ==========================================================

  Future<void> openMovieUrl(String url) async {

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  // ==========================================================
  // TOGGLE BOOKMARK
  // ==========================================================

  void toggleBookmark(Movie movie) {

    setState(() {

      if (bookmarkedMovies.contains(movie.title)) {
        bookmarkedMovies.remove(movie.title);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Removed from Watchlist"),
            duration: Duration(seconds: 1),
          ),
        );

      } else {

        bookmarkedMovies.add(movie.title);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Added to Watchlist ⭐"),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF09090D),

      body: SafeArea(

        child: Column(

          children: [

            // ==================================================
            // HEADER - ROW
            // ==================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                12,
              ),

              child: Row(

                children: [

                  Expanded(
                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: const [

                        Text(
                          "CineVerse",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          "Movies worth watching",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search
                  GestureDetector(
                    onTap: () {

                      showSearch(
                        context: context,
                        delegate: MovieSearchDelegate(movies),
                      );
                    },

                    child: Container(
                      padding: const EdgeInsets.all(11),

                      decoration: BoxDecoration(
                        color: const Color(0xFF17171F),
                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Profile
                  Container(
                    width: 43,
                    height: 43,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,

                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8B5CF6),
                          Color(0xFFEC4899),
                        ],
                      ),
                    ),

                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // MAIN CONTENT
            // ==================================================

            Expanded(
              child: _buildSelectedTab(),
            ),
          ],
        ),
      ),

      // ==========================================================
      // BOTTOM NAVIGATION - ROW
      // ==========================================================

      bottomNavigationBar: Container(

        height: 72,

        decoration: const BoxDecoration(
          color: Color(0xFF111116),

          border: Border(
            top: BorderSide(
              color: Color(0xFF24242C),
            ),
          ),
        ),

        child: Row(

          mainAxisAlignment:
              MainAxisAlignment.spaceAround,

          children: [

            buildBottomItem(
              Icons.home_rounded,
              "Home",
              selectedTab == 0,
              0,
            ),

            buildBottomItem(
              Icons.explore_outlined,
              "Explore",
              selectedTab == 1,
              1,
            ),

            buildBottomItem(
              Icons.bookmark_border,
              "Watchlist",
              selectedTab == 2,
              2,
            ),

            buildBottomItem(
              Icons.person_outline,
              "Profile",
              selectedTab == 3,
              3,
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // SELECTED TAB CONTENT
  // ==========================================================

  Widget _buildSelectedTab() {
    if (selectedTab == 1) {
      return _buildExplorePage();
    }

    if (selectedTab == 2) {
      return _buildWatchlistPage();
    }

    if (selectedTab == 3) {
      return _buildProfilePage();
    }

    return _buildHomePage();
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: buildFeaturedMovie(),
          ),

          const SizedBox(height: 30),

          buildSectionHeader("Browse", "Swipe →"),
          const SizedBox(height: 12),
          _buildScrollableGenreRow(),

          const SizedBox(height: 30),

          buildSectionHeader("Coming Soon", "Swipe ← →"),
          const SizedBox(height: 15),
          _buildScrollableMovieRow(),

          const SizedBox(height: 32),

          buildSectionHeader(
            selectedGenre == "All"
                ? "Popular Movies"
                : "$selectedGenre Movies",
            "2-column grid",
          ),
          const SizedBox(height: 15),
          _buildMovieGrid(filteredMovies),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildExplorePage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Explore",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Discover all movies in CineVerse",
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 22),

          _buildScrollableGenreRow(),

          const SizedBox(height: 25),

          _buildMovieGrid(
            selectedGenre == "All"
                ? movies
                : movies.where((m) => m.genre == selectedGenre).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchlistPage() {
    final watchlist = movies
        .where((movie) => bookmarkedMovies.contains(movie.title))
        .toList();

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Watchlist",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Movies you saved for later",
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 25),

          if (watchlist.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 55,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF15151C),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.white38,
                    size: 55,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Your watchlist is empty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Tap the bookmark icon on any movie to save it here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          else
            _buildMovieGrid(watchlist),
        ],
      ),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 35),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            width: 105,
            height: 105,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8B5CF6),
                  Color(0xFFEC4899),
                ],
              ),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 55,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Sayee",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Movie enthusiast • CineVerse member",
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 30),

          _profileInfoCard(
            Icons.bookmark,
            "Watchlist",
            "${bookmarkedMovies.length} movies saved",
          ),
          const SizedBox(height: 12),
          _profileInfoCard(
            Icons.movie_outlined,
            "Library",
            "${movies.length} movies available",
          ),
          const SizedBox(height: 12),
          _profileInfoCard(
            Icons.star_outline,
            "Favourite genre",
            "Adventure & Horror",
          ),
        ],
      ),
    );
  }

  Widget _profileInfoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // HORIZONTAL ROWS
  // ==========================================================

  void _handleHorizontalScroll(
    PointerSignalEvent event,
    ScrollController controller,
  ) {
    if (event is PointerScrollEvent &&
        controller.hasClients &&
        event.scrollDelta.dx != 0) {
      final double target = (controller.offset + event.scrollDelta.dx)
          .clamp(0.0, controller.position.maxScrollExtent);

      controller.jumpTo(target);
    }
  }

  Widget _buildScrollableGenreRow() {
    return SizedBox(
      height: 48,
      child: Listener(
        onPointerSignal: (event) {
          _handleHorizontalScroll(
            event,
            genreScrollController,
          );
        },
        child: Row(
          children: [
            _horizontalArrow(
              Icons.chevron_left,
              () {
                genreScrollController.animateTo(
                  (genreScrollController.offset - 180).clamp(
                    0.0,
                    genreScrollController.position.maxScrollExtent,
                  ),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: genreScrollController,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildGenreChip("All"),
                    buildGenreChip("Action"),
                    buildGenreChip("Horror"),
                    buildGenreChip("Adventure"),
                    buildGenreChip("Sci-Fi"),
                    buildGenreChip("Animation"),
                    buildGenreChip("Drama"),
                    buildGenreChip("Thriller"),
                  ],
                ),
              ),
            ),
            _horizontalArrow(
              Icons.chevron_right,
              () {
                genreScrollController.animateTo(
                  (genreScrollController.offset + 180).clamp(
                    0.0,
                    genreScrollController.position.maxScrollExtent,
                  ),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableMovieRow() {
    return SizedBox(
      height: 250,
      child: Listener(
        onPointerSignal: (event) {
          _handleHorizontalScroll(
            event,
            movieRowScrollController,
          );
        },
        child: Row(
          children: [
            _horizontalArrow(
              Icons.chevron_left,
              () {
                movieRowScrollController.animateTo(
                  (movieRowScrollController.offset - 210).clamp(
                    0.0,
                    movieRowScrollController.position.maxScrollExtent,
                  ),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: movieRowScrollController,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: movies.map(buildHorizontalMovieCard).toList(),
                ),
              ),
            ),
            _horizontalArrow(
              Icons.chevron_right,
              () {
                movieRowScrollController.animateTo(
                  (movieRowScrollController.offset + 210).clamp(
                    0.0,
                    movieRowScrollController.position.maxScrollExtent,
                  ),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _horizontalArrow(
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B23),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white70,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildMovieGrid(List<Movie> list) {
    if (list.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(35),
        child: const Center(
          child: Text(
            "No movies in this section yet.",
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 18,
          childAspectRatio: 0.57,
        ),
        itemBuilder: (context, index) {
          return buildMovieCard(list[index]);
        },
      ),
    );
  }

  // ==========================================================
  // FEATURED MOVIE STACK
  // ==========================================================

  Widget buildFeaturedMovie() {
    final movie = movies[1];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: showTrailer ? 465 : 470,
      decoration: BoxDecoration(
        color: const Color(0xFF111116),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.45),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          children: [
            // Background: poster before playback, dark cinematic surface after.
            Positioned.fill(
              child: showTrailer
                  ? Container(
                      color: const Color(0xFF09090D),
                    )
                  : Image.network(
                      movie.posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF172554),
                          child: const Icon(
                            Icons.movie,
                            color: Colors.white54,
                            size: 70,
                          ),
                        );
                      },
                    ),
            ),

            // Cinematic overlay only for the poster state.
            if (!showTrailer)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.08),
                        Colors.black.withOpacity(0.25),
                        const Color(0xFF09090D).withOpacity(0.98),
                      ],
                      stops: const [0.0, 0.43, 1.0],
                    ),
                  ),
                ),
              ),

            // Trailer: integrated into the card rather than floating over
            // the poster.
            if (showTrailer)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 235,
                child: Container(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                    child: YoutubePlayer(
                      controller: youtubeController,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                ),
              )
            else
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 220,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showTrailer = true;
                      });
                      youtubeController.playVideo();
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.96),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.35),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),

            // Trailer label / close button
            if (showTrailer)
              Positioned(
                top: 12,
                left: 14,
                child: _featuredPill(
                  "TRAILER",
                  Icons.play_circle_outline,
                ),
              ),

            if (showTrailer)
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    youtubeController.pauseVideo();
                    setState(() {
                      showTrailer = false;
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.65),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),

            // Featured badge
            Positioned(
              top: showTrailer ? 250 : 230,
              left: 20,
              child: _featuredPill(
                "FEATURED",
                Icons.local_fire_department_outlined,
              ),
            ),

            // Movie information
            Positioned(
              left: 20,
              right: 20,
              bottom: 19,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "THE ODYSSEY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFBBF24),
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "9.1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 13),
                      Text(
                        "2026",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(width: 13),
                      Text(
                        "Epic • Adventure",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    "A mythic journey home after the Trojan War, "
                    "directed by Christopher Nolan.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showTrailer = true;
                          });
                          youtubeController.playVideo();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 19,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Play Trailer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      GestureDetector(
                        onTap: () {
                          openMovieUrl(movie.trailerUrl);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.open_in_new,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredPill(
    String text,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.42),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }


  // ==========================================================
  // SECTION HEADER
  // ==========================================================

  Widget buildSectionHeader(
    String title,
    String trailing,
  ) {

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: Row(

        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const Spacer(),

          Text(
            trailing,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // GENRE CHIP
  // ==========================================================

  Widget buildGenreChip(String genre) {

    final bool selected =
        selectedGenre == genre;

    return GestureDetector(

      onTap: () {

        setState(() {
          selectedGenre = genre;
        });
      },

      child: Container(

        margin:
            const EdgeInsets.only(
          right: 9,
        ),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration:
            BoxDecoration(

          color: selected
              ? Colors.white
              : const Color(0xFF181820),

          borderRadius:
              BorderRadius.circular(
            22,
          ),
        ),

        child: Text(
          genre,

          style: TextStyle(
            color: selected
                ? Colors.black
                : Colors.white60,

            fontWeight:
                FontWeight.w600,

            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // HORIZONTAL MOVIE CARD - ROW
  // ==========================================================

  Widget buildHorizontalMovieCard(
    Movie movie,
  ) {

    return GestureDetector(

      onTap: () {
        openMovieUrl(movie.trailerUrl);
      },

      child: Container(

        width: 145,

        margin:
            const EdgeInsets.only(
          right: 13,
        ),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Expanded(

              child: ClipRRect(

                borderRadius:
                    BorderRadius.circular(
                  15,
                ),

                child: Image.network(
                  movie.posterUrl,

                  width: double.infinity,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stack) {

                    return Container(
                      color:
                          const Color(0xFF22222B),

                      child: const Icon(
                        Icons.movie,
                        color:
                            Colors.white38,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              movie.title,

              maxLines: 1,

              overflow:
                  TextOverflow.ellipsis,

              style: const TextStyle(
                color: Colors.white,
                fontWeight:
                    FontWeight.bold,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 3),

            Row(
              children: [

                const Icon(
                  Icons.star,
                  color:
                      Color(0xFFFBBF24),
                  size: 13,
                ),

                const SizedBox(width: 3),

                Text(
                  movie.rating,
                  style: const TextStyle(
                    color:
                        Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // GRID MOVIE CARD - STACK
  // ==========================================================

  Widget buildMovieCard(Movie movie) {

    final bool bookmarked =
        bookmarkedMovies.contains(
      movie.title,
    );

    return GestureDetector(

      onTap: () {
        openMovieUrl(movie.trailerUrl);
      },

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Expanded(

            child: Stack(

              children: [

                // Poster
                Positioned.fill(

                  child: ClipRRect(

                    borderRadius:
                        BorderRadius.circular(
                      17,
                    ),

                    child: Image.network(
                      movie.posterUrl,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stack) {

                        return Container(
                          color:
                              const Color(
                            0xFF22222B,
                          ),

                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              color:
                                  Colors.white38,
                              size: 40,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Gradient
                Positioned.fill(

                  child: ClipRRect(

                    borderRadius:
                        BorderRadius.circular(
                      17,
                    ),

                    child: Container(
                      decoration:
                          BoxDecoration(
                        gradient:
                            LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,

                          colors: [
                            Colors.transparent,
                            Colors.black
                                .withOpacity(
                              0.85,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Rating
                Positioned(
                  top: 9,
                  right: 9,

                  child: Container(

                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 7,
                      vertical: 5,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.black
                          .withOpacity(
                        0.75,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        8,
                      ),
                    ),

                    child: Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color:
                              Color(0xFFFBBF24),
                          size: 12,
                        ),

                        const SizedBox(width: 3),

                        Text(
                          movie.rating,
                          style:
                              const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bookmark
                Positioned(
                  top: 9,
                  left: 9,

                  child: GestureDetector(

                    onTap: () {
                      toggleBookmark(movie);
                    },

                    child: Container(

                      padding:
                          const EdgeInsets.all(
                        7,
                      ),

                      decoration:
                          BoxDecoration(
                        color: Colors.black
                            .withOpacity(
                          0.65,
                        ),

                        shape:
                            BoxShape.circle,
                      ),

                      child: Icon(
                        bookmarked
                            ? Icons.bookmark
                            : Icons
                                .bookmark_border,

                        color:
                            bookmarked
                                ? Colors.white
                                : Colors.white70,

                        size: 17,
                      ),
                    ),
                  ),
                ),

                // Play button
                const Positioned(
                  bottom: 10,
                  left: 10,

                  child: CircleAvatar(
                    radius: 17,

                    backgroundColor:
                        Colors.white,

                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),

                // Year
                Positioned(
                  bottom: 12,
                  right: 10,

                  child: Text(
                    movie.year,
                    style:
                        const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Text(
            movie.title,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            movie.genre,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // BOTTOM NAVIGATION ITEM
  // ==========================================================

  Widget buildBottomItem(
    IconData icon,
    String label,
    bool selected,
    int tabIndex,
  ) {

    return GestureDetector(

      onTap: () {
        setState(() {
          selectedTab = tabIndex;
          if (tabIndex != 0) {
            selectedGenre = "All";
          }
        });
      },

      child: Column(

        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,

            color: selected
                ? Colors.white
                : Colors.white38,
          ),

          const SizedBox(height: 4),

          Text(
            label,

            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Colors.white38,

              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SEARCH DELEGATE
// ============================================================

class MovieSearchDelegate
    extends SearchDelegate<Movie?> {

  final List<Movie> movies;

  MovieSearchDelegate(this.movies);

  @override
  List<Widget>? buildActions(
    BuildContext context,
  ) {

    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(
    BuildContext context,
  ) {

    return IconButton(
      onPressed: () {
        close(context, null);
      },

      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(
    BuildContext context,
  ) {

    final results = movies
        .where(
          (movie) => movie.title
              .toLowerCase()
              .contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return buildSearchList(results);
  }

  @override
  Widget buildSuggestions(
    BuildContext context,
  ) {

    final results = movies
        .where(
          (movie) => movie.title
              .toLowerCase()
              .contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return buildSearchList(results);
  }

  Widget buildSearchList(
    List<Movie> results,
  ) {

    if (results.isEmpty) {

      return const Center(
        child: Text(
          "No movies found",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
      );
    }

    return ListView.builder(

      itemCount: results.length,

      itemBuilder:
          (context, index) {

        final movie =
            results[index];

        return ListTile(

          leading:
              ClipRRect(
            borderRadius:
                BorderRadius.circular(
              8,
            ),

            child: Image.network(
              movie.posterUrl,

              width: 45,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          title: Text(
            movie.title,
            style:
                const TextStyle(
              color: Colors.white,
            ),
          ),

          subtitle: Text(
            "${movie.year} • ${movie.genre}",
            style:
                const TextStyle(
              color: Colors.white54,
            ),
          ),

          trailing:
              const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.white38,
          ),
        );
      },
    );
  }
}