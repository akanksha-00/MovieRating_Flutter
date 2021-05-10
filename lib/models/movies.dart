import 'package:moving_rating/services/database.dart';

class Movies {
  final String name;
  final String description;
  final String genre;
  double rating;
  int count;

  Movies({this.name, this.description, this.genre, this.rating, this.count});

  void updateRating(
      double currRating, double prevRating, int count, int update) {
    print('Initial rating $rating');
    print('Count $count');
    print('PrevRating $prevRating');
    print('Current rating $currRating');
    print('Update $update');

    if (update == -1) {
      if (count == 0) {
        rating = 0.0;
        this.count = 0;
      } else if (count == 1) {
        rating = 0.0;
        this.count = 0;
      } else {
        rating = rating * count - prevRating;
        this.count = count - 1;
        rating /= this.count;
      }
    } else {
      rating = rating * count - prevRating + currRating;
      this.count = update == 1 ? count : count + 1;
      rating /= this.count;
    }

    print('Final rating $rating');
    ratingsList = movies.map((e) => e.rating).toList();
    countList = movies.map((e) => e.count).toList();
    DatabaseServices().updateGlobalRatings();
  }
}

List<Movies> movies = [
  Movies(
      name: 'Joker',
      description:
          'Joker is a 2019 American psychological thriller film directed and produced by Todd Phillips, who co-wrote the screenplay with Scott Silver. The film, based on DC Comics characters',
      genre: 'Thriller',
      rating: 0.0,
      count: 0),
  Movies(
    name: 'IT',
    description:
        'It, retroactively known as It Chapter One, is a 2017 supernatural horror film based on Stephen Kings 1986 novel of the same name. Produced by New Line Cinema, KatzSmith Productions.',
    genre: 'Thriller',
    rating: 0.0,
    count: 0,
  ),
  Movies(
      name: 'Bird Box',
      description:
          'Bird Box is a 2018 American post-apocalyptic horror thriller film directed by Susanne Bier, following a screenplay written by Eric Heisserer, and based on the 2014 novel of the same name by Josh Malerman.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0),
  Movies(
      name: 'Parasite',
      description:
          'Parasite is a 2019 South Korean black comedy thriller film directed by Bong Joon-ho, who co-wrote the screenplay with Han Jin-won. The film, starring Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-shik.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0),
  Movies(
      name: 'JumanJi',
      description:
          'Jumanji: Welcome to the Jungle is a 2017 American fantasy adventure comedy film directed by Jake Kasdan, co-written by Chris McKenna, Erik Sommers, Scott Rosenberg, and Jeff Pinkner, and starring Dwayne Johnson.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0),
  Movies(
      name: 'Despicable Me',
      description:
          'Despicable Me is an American computer-animated media franchise centering on Gru, a reformed super-villain (who later becomes a father, husband, and secret agent), and his yellow-colored Minions.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0)
];

List ratingsList = [];
List countList = [];
