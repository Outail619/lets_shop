enum Flavor {
  dev;

  static Flavor? parse(String data) {
    if (data == Flavor.dev.name) {
      return Flavor.dev;
    }

    return null;
  }
}
