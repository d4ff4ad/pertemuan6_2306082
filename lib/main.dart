import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner debug (opsional)
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Ubah _formkey menjadi _formKey (camelCase standar Dart)
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 2. Tambahkan dispose untuk mencegah memory leak
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      String username = usernameController.text;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login berhasil: $username")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username wajib diisi";
                  }
                  if (value.length < 4) {
                    return "Minimal 4 Huruf";
                  }
                  return null;
                },
              ),
              // 3. Tambahkan jarak (SizedBox) antara Username dan Password biar UI-nya rapi
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText:
                    true, // 4. PENTING: Bikin teks password jadi titik-titik/sensor
                decoration: const InputDecoration(
                  labelText: "Password", // Huruf awal kapital
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password wajib diisi"; // 5. Typo "passwodd" diperbaiki
                  }
                  if (value.length < 4) {
                    return "Minimal 4 Huruf";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: login,
                child: const Text(
                  "Login",
                ), // 6. Ubah "Simpan" jadi "Login" biar pas dengan fungsinya
              ),
            ],
          ),
        ),
      ),
    );
  }
}
