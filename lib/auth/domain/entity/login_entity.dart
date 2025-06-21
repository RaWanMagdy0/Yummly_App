class UserEntity {
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? phoneNumber;
  final String? onVerificationCompleted;
  final String? onVerificationFailed;
  final String? onCodeSent;
  final String? onCodeAutoRetrievalTimeout;

  UserEntity({
    required this.id,
    this.onVerificationCompleted,
    this.onVerificationFailed,
    this.onCodeSent,
    this.onCodeAutoRetrievalTimeout,
    this.email,
    this.name,
    this.photoUrl,
    this.phoneNumber,
  });
}
