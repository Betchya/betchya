import 'package:betchya/logic/games/game_category.dart';

// Dictionary-like type to look up NBA teams from abbreviations
final Map<String, String> nbaTeamsAbbreviations = {
  'ATL': 'Atlanta Hawks',
  'BOS': 'Boston Celtics',
  'BKN': 'Brooklyn Nets',
  'CHA': 'Charlotte Hornets',
  'CHI': 'Chicago Bulls',
  'CLE': 'Cleveland Cavaliers',
  'DAL': 'Dallas Mavericks',
  'DEN': 'Denver Nuggets',
  'DET': 'Detroit Pistons',
  'GSW': 'Golden State Warriors',
  'HOU': 'Houston Rockets',
  'IND': 'Indiana Pacers',
  'LAC': 'LA Clippers',
  'LAL': 'Los Angeles Lakers',
  'MEM': 'Memphis Grizzlies',
  'MIA': 'Miami Heat',
  'MIL': 'Milwaukee Bucks',
  'MIN': 'Minnesota Timberwolves',
  'NOP': 'New Orleans Pelicans',
  'NYK': 'New York Knicks',
  'OKC': 'Oklahoma City Thunder',
  'ORL': 'Orlando Magic',
  'PHI': 'Philadelphia 76ers',
  'PHX': 'Phoenix Suns',
  'POR': 'Portland Trail Blazers',
  'SAC': 'Sacramento Kings',
  'SAS': 'San Antonio Spurs',
  'TOR': 'Toronto Raptors',
  'UTA': 'Utah Jazz',
  'WAS': 'Washington Wizards',
};

// Dictionary-like type to look up MLB teams from abbreviations
final Map<String, String> mlbTeamsAbbreviations = {
  'ARI': 'Arizona Diamondbacks',
  'ATL': 'Atlanta Braves',
  'BAL': 'Baltimore Orioles',
  'BOS': 'Boston Red Sox',
  'CHC': 'Chicago Cubs',
  'CHW': 'Chicago White Sox',
  'CIN': 'Cincinnati Reds',
  'CLE': 'Cleveland Guardians',
  'COL': 'Colorado Rockies',
  'DET': 'Detroit Tigers',
  'HOU': 'Houston Astros',
  'KC': 'Kansas City Royals',
  'LAA': 'Los Angeles Angels',
  'LAD': 'Los Angeles Dodgers',
  'MIA': 'Miami Marlins',
  'MIL': 'Milwaukee Brewers',
  'MIN': 'Minnesota Twins',
  'NYM': 'New York Mets',
  'NYY': 'New York Yankees',
  'OAK': 'Oakland Athletics',
  'PHI': 'Philadelphia Phillies',
  'PIT': 'Pittsburgh Pirates',
  'SD': 'San Diego Padres',
  'SF': 'San Francisco Giants',
  'SEA': 'Seattle Mariners',
  'STL': 'St. Louis Cardinals',
  'TB': 'Tampa Bay Rays',
  'TEX': 'Texas Rangers',
  'TOR': 'Toronto Blue Jays',
  'WSH': 'Washington Nationals',
};

// Function to look up team names
// Allows to separate based on sport type if there is the same abbreviation
String? getTeamName(String? gameCategory, String? teamAbbreviation) {
  // Stops from wrong team name to be displayed when in the middle of switching to another sport
  if (!loading) {
    if (gameCategory == 'NBA') {
      return nbaTeamsAbbreviations[teamAbbreviation];
    } else if (gameCategory == 'MLB') {
      return mlbTeamsAbbreviations[teamAbbreviation];
    // No existing gameCategory exists
    } else {
      return 'Loading';
    }
  // In the middle of loading
  } else {
    return 'Loading';
  }
}
