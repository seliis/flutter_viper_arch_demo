class InteractorOfAuth {
  static final _instance = InteractorOfAuth._singleInstance();
  factory InteractorOfAuth() => _instance;
  InteractorOfAuth._singleInstance();

  static bool isMember(String id, String pw) {
    // actual code might be using http for asking to server. just return true for example.
    return true;
  }
}
