class Wonder{
  final String title;
  final String image;
  final String description;
  final String slogan;
  Wonder({required this.title,required this.image,required this.description,required this.slogan});
}


List<Wonder>wonderList=[
  Wonder(title: "Colosseum",image: "assets/wonder1.webp",description: "The Colosseum, also named the Flavian Amphitheater, is a large amphitheater in Rome. It was built during the reign of the Flavian emperors as a gift to the Roman people.", slogan: "When in Rome, do as the Romans do",),
  Wonder(title: "Taj Mahal",image: "assets/wonder2.jpeg",description: "An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan in memory of his favourite wife, the Taj Mahal is the jewel of Muslim art in India and one of the universally admired masterpieces of the world's heritage.", slogan: "Beauty that never ends",),
  Wonder(title: "Christ the Redeemer",image: "assets/wonder3.jpeg",description: "Christ The Redeemer is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot. Romanian sculptor Gheorghe Leonida sculpted the face", slogan: "All right, that's nice, I'm going to Rio",),
  Wonder(title: "Great Wall of China",image: "assets/wonder4.jpeg",description: "The Great Wall is reputed as one of the seven construction wonders in the world not only for its long history, but its massive construction size, and its unique architectural style as well. A great army of manpower, composed of soldiers, prisoners, and local people, built the wall.", slogan: "One of my challenges was to try to photograph the Great Wall of China",),
  Wonder(title: "Isfahan",image: "assets/wonder5.jpg",description: "Isfahan, Iran's cultural gem, boasts stunning architecture, like the Imam Mosque and Naqsh-e Jahan Square. Rich history and vibrant culture await visitors.", slogan: "Where History and Beauty Unite",),
];