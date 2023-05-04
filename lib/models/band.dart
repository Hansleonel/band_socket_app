class Band {
  String id;
  String name;
  int votes;

  Band({
    required this.id,
    required this.name,
    this.votes = 0,
  });

  factory Band.fromMap(Map<String, dynamic> object) => Band(
        id: object.containsKey('id') ? object['id'] : 'no-id',
        name: object.containsKey('name') ? object['name'] : 'no-name',
        votes: object.containsKey('votes') ? object['votes'] : 'no-votes',
      );
}
