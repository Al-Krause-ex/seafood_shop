abstract interface class AuthRepositoryInterface {
  Future<void> signUp();
  Future<void> signIn();
  Future<void> signOut();
  Future<void> changePassword();
  Future<void> deleteAccount();
}
