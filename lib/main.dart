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
          false, 
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
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
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
              
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText:
                    true, 
                decoration: const InputDecoration(
                  labelText: "Password", 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password wajib diisi"; 
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
                ), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
