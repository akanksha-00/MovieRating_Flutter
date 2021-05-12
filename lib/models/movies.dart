import 'package:moving_rating/services/database.dart';

class Movies {
  final String name;
  final String description;
  final String genre;
  final int index;
  double rating;
  int count;

  Movies(
      {this.name,
      this.description,
      this.genre,
      this.index,
      this.rating,
      this.count});

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
      count: 0,
      index: 1),
  Movies(
      name: 'IT',
      description:
          'It, retroactively known as It Chapter One, is a 2017 supernatural horror film based on Stephen Kings 1986 novel of the same name. Produced by New Line Cinema, KatzSmith Productions.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 2),
  Movies(
      name: 'Bird Box',
      description:
          'Bird Box is a 2018 American post-apocalyptic horror thriller film directed by Susanne Bier, following a screenplay written by Eric Heisserer, and based on the 2014 novel of the same name by Josh Malerman.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 3),
  Movies(
      name: 'Nightwcrawler',
      description:
          'Nightcrawler is a 2014 American neo-noir thriller film written and directed by Dan Gilroy. It stars Jake Gyllenhaal as Louis "Lou" Bloom, a stringer who records violent events late at night in Los Angeles and sells the footage to a local television news station.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 4),
  Movies(
      name: 'Shutter Island',
      description:
          'Shutter Island is a 2010 American neo-noir psychological thriller film directed by Martin Scorsese and written by Laeta Kalogridis, based on Dennis Lehane\'s 2003 novel of the same name. Leonardo DiCaprio stars as Deputy U.S. Marshal Edward "Teddy" Daniels.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 5),
  Movies(
      name: 'Invitation',
      description:
          'The Invitation is a 2015 American horror film[3] directed by Karyn Kusama and written by Phil Hay and Matt Manfredi. The film stars Logan Marshall-Green, Tammy Blanchard, Michiel Huisman, and Emayatzy Corinealdi. ',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 6),
  Movies(
      name: 'Us',
      description:
          'Us is a 2019 American horror film written and directed by Jordan Peele, starring Lupita Nyong\'o, Winston Duke, Elisabeth Moss, and Tim Heidecker. The film follows Adelaide Wilson (Nyong\'o) and her family, who are attacked by a group of menacing doppelgängers.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 7),
  Movies(
      name: 'Widows',
      description:
          'Widows is a 2018 heist thriller film directed by Steve McQueen from a screenplay by Gillian Flynn and McQueen,[3] based upon the 1983 British television series of the same name.',
      genre: 'Thriller',
      rating: 0.0,
      count: 0,
      index: 8),
  Movies(
      name: 'Parasite',
      description:
          'Parasite is a 2019 South Korean black comedy thriller film directed by Bong Joon-ho, who co-wrote the screenplay with Han Jin-won. The film, starring Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-shik.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 9),
  Movies(
      name: 'JumanJi',
      description:
          'Jumanji: Welcome to the Jungle is a 2017 American fantasy adventure comedy film directed by Jake Kasdan, co-written by Chris McKenna, Erik Sommers, Scott Rosenberg, and Jeff Pinkner, and starring Dwayne Johnson.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 10),
  Movies(
      name: 'Despicable Me',
      description:
          'Despicable Me is an American computer-animated media franchise centering on Gru, a reformed super-villain (who later becomes a father, husband, and secret agent), and his yellow-colored Minions.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 11),
  Movies(
      name: 'Dictator',
      description:
          'The Dictator is a 2012 political satire comedy film co-written by and starring Sacha Baron Cohen as his fourth feature film in a leading role. The film is directed by Larry Charles, who previously directed Baron Cohen\'s mockumentaries Borat and Brüno. ',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 12),
  Movies(
      name: 'Minions',
      description:
          'Minions is a 2015 American computer-animated comedy film produced by Illumination Entertainment and distributed by Universal Pictures. It is the spin-off prequel and the third installment overall in the Despicable Me franchise.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 13),
  Movies(
      name: 'Home Alone',
      description:
          'Home Alone is a 1990 American comedy film written and produced by John Hughes and directed by Chris Columbus. It stars Macaulay Culkin, Joe Pesci, Daniel Stern, John Heard, and Catherine O\'Hara. ',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 14),
  Movies(
      name: 'The Nice Guys',
      description:
          'The Nice Guys is a 2016 American neo-noir action comedy film directed by Shane Black and written by Black and Anthony Bagarozzi. The film stars Russell Crowe, Ryan Gosling, Angourie Rice, Matt Bomer, Margaret Qualley, Keith David and Kim Basinger. ',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 15),
  Movies(
      name: 'Zombieland',
      description:
          'A shy student trying to reach his family in Ohio, a gun-toting bruiser in search or the last Twinkie and a pair of sisters striving to get to an amusement park join forces in a trek across a zombie-filled America.',
      genre: 'Comedy',
      rating: 0.0,
      count: 0,
      index: 16),
  Movies(
      name: 'The Martian',
      description:
          'The Martian is a 2015 science fiction film directed by Ridley Scott and starring Matt Damon. Drew Goddard adapted the screenplay from The Martian, a 2011 novel by Andy Weir.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 17),
  Movies(
      name: 'Arrival',
      description:
          'Arrival is a 2016 American science fiction drama film directed by Denis Villeneuve and written by Eric Heisserer. Based on the 1998 short story "Story of Your Life" by Ted Chiang, it stars Amy Adams, Jeremy Renner, and Forest Whitaker.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 18),
  Movies(
      name: 'Outside The Wire',
      description:
          'Outside the Wire is a 2021 American science fiction action film directed by Mikael Håfström. It stars Anthony Mackie (who also produced) as an android officer who works with a drone pilot (Damson Idris) to stop a global catastrophe.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 19),
  Movies(
      name: 'War of The Planet of The Apes',
      description:
          'War for the Planet of the Apes is a 2017 American science fiction action film[5] directed by Matt Reeves, produced by Dylan Clark, Rick Jaffa and Amanda Silver and written by Mark Bomback and Reeves.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 20),
  Movies(
      name: 'Men in Black: International',
      description:
          'Men in Black: International (stylized as MIB: International in promotional material) is a 2019 American science fiction action comedy film directed by F. Gary Gray and written by Art Marcum and Matt Holloway.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 21),
  Movies(
      name: 'Tenet',
      description:
          'Tenet is a 2020 science fiction action-thriller film written and directed by Christopher Nolan, who produced it with Emma Thomas. A co-production between the United Kingdom and United States, it stars John David Washington, Robert Pattinson, Elizabeth Debicki.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 22),
  Movies(
      name: 'Annihilation',
      description:
          'Annihilation is a 2018 science fiction horror film written and directed by Alex Garland, based on the 2014 novel of the same name by Jeff VanderMeer. It stars Natalie Portman, Jennifer Jason Leigh, Gina Rodriguez, Tessa Thompson, Tuva Novotny, and Oscar Isaac.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 23),
  Movies(
      name: 'Godzilla: King of the Monsters',
      description:
          'Godzilla: King of the Monsters is a 2019 American monster film directed and co-written by Michael Dougherty. A sequel to Godzilla (2014), it is the 35th film in the Godzilla franchise, the third film in Legendary\'s MonsterVerse, and the third Godzilla film to be completely produced by a Hollywood studio.',
      genre: 'SciFi',
      rating: 0.0,
      count: 0,
      index: 24),
  Movies(
      name: 'Forrest Gump',
      description:
          'Forrest Gump is a 1994 American drama film directed by Robert Zemeckis and written by Eric Roth with comedic aspects. It is based on the 1986 novel of the same name by Winston Groom and stars Tom Hanks, Robin Wright, Gary Sinise, Mykelti Williamson and Sally Field.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 25),
  Movies(
      name: 'Room',
      description:
          'Room is a 2015 drama film directed by Lenny Abrahamson and written by Emma Donoghue, based on her 2010 novel of the same name. It stars Brie Larson as a young woman who has been held captive for seven years and whose five-year-old son (Jacob Tremblay) was born in captivity.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 26),
  Movies(
      name: 'The Imitation Game',
      description:
          'The Imitation Game is a 2014 historical drama film directed by Morten Tyldum and written by Graham Moore, based on the 1983 biography Alan Turing: The Enigma by Andrew Hodges.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 27),
  Movies(
      name: 'Spotlight',
      description:
          'Spotlight is a 2015 American biographical drama film directed by Tom McCarthy and written by McCarthy and Josh Singer.[5][6] The film follows The Boston Globe\'s "Spotlight" team, the oldest continuously operating newspaper investigative journalist unit in the United States.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 28),
  Movies(
      name: 'Little Women',
      description:
          'Little Women is a 2019 American coming-of-age period drama film written and directed by Greta Gerwig. It is the seventh film adaptation of the 1868 novel of the same name by Louisa May Alcott.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 29),
  Movies(
      name: 'Dunkirk',
      description:
          'Dunkirk is a 2017 war film written, directed, and produced by Christopher Nolan that depicts the Dunkirk evacuation of World War II. Its ensemble cast includes Fionn Whitehead, Tom Glynn-Carney, Jack Lowden, Harry Styles.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 30),
  Movies(
      name: 'Titanic',
      description:
          'Titanic is a 1997 American epic romance and disaster film directed, written, co-produced, and co-edited by James Cameron. Incorporating both historical and fictionalized aspects, it is based on accounts of the sinking of the RMS Titanic.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 31),
  Movies(
      name: 'The Favourite',
      description:
          'The Favourite is a 2018 period black comedy film co-produced and directed by Yorgos Lanthimos, from a screenplay by Deborah Davis and Tony McNamara. Set in early 18th century Great Britain, the film\'s plot examines the relationship between cousins.',
      genre: 'Drama',
      rating: 0.0,
      count: 0,
      index: 32),
];

List ratingsList = [];
List countList = [];
List genreList = ['Thriller', 'Comedy', 'SciFi', 'Drama'];
