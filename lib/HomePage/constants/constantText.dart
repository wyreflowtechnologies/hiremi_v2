class FeaturedText {

  static const String featuredSectionTitle = "Hiremi's Featured";

  static const Map<String, Map<String, String>> featuredItems = {
    'askExpert': {
      'title': 'Ask Expert',
      'subtitle': 'Ask Anything Get\nExpert Guidance',
    },
    'internship': {
      'title': 'Internship',
      'subtitle': 'Gain Practical\nExperience',
    },
    'status': {
      'title': 'Status',
      'subtitle': 'Apply Mentorship\n& more',
    },
    'freshers': {
      'title': 'Freshers',
      'subtitle': 'Gain Practical\nExperience',
    },
    'hiremi360': {
      'title': 'Hiremi 360',
      'subtitle': 'Gain Practical\nExperience',
    },
    'experience': {
      'title': 'Experience',
      'subtitle': 'Explore diverse\ncareers',
    },
  };

  static String getTitle(String key) => featuredItems[key]?['title'] ?? '';
  static String getSubtitle(String key) => featuredItems[key]?['subtitle'] ?? '';
}
