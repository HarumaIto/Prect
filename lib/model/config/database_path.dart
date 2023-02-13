enum DatabaseUserIdChild {
  log('log'),
  devices('devices');

  const DatabaseUserIdChild(this.name);

  final String name;
}

enum DatabaseLogChild {
  humidity('Humidity'),
  moisture('Moisture'),
  temperature('Temperature'),
  timestamp('Ts');

  const DatabaseLogChild(this.name);

  final String name;
}