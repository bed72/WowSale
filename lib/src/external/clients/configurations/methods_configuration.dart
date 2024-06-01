enum MethodConfiguration {
  get(value: 'GET'),
  put(value: 'PUT'),
  post(value: 'POST'),
  delete(value: 'DELETE');

  final String value;

  const MethodConfiguration({required this.value});
}
