class AuthService {
  static final Map<String, Map<String, String>> _rolesCredentials = {
    'Admin': {'email': '...', 'password': '...'},
    'Pimpinan': {'email': 'pimpinan@bps.go.id', 'password': 'password123'},
    'Teknisi': {'email': '...', 'password': '...'},
    'Pengelola Barang': {
      'email': 'barang@bps.go.id',
      'password': 'password123',
    },
    'Pengelola Ruangan': {
      'email': 'ruangan@bps.go.id',
      'password': 'password123',
    },
    'User': {'email': 'user@bps.go.id', 'password': 'password123'},
  };

  static dynamic verifyLogin(String email, String password, String role) {
    if (!_rolesCredentials.containsKey(role)) {
      return "Role tidak ditemukan.";
    }

    final validEmail = _rolesCredentials[role]!['email'];
    final validPassword = _rolesCredentials[role]!['password'];

    if (email != validEmail) {
      return "Email salah untuk role $role.";
    }

    if (password != validPassword) {
      return "Password yang dimasukkan salah.";
    }

    return true; // Login success
  }
}
