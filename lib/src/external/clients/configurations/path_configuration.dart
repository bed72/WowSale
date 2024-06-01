enum PathConfiguration {
  base(value: 'http://127.0.0.1:8090/api'),
  signIn(value: '/collections/users/auth-with-password');

  final String value;

  const PathConfiguration({required this.value});
}
