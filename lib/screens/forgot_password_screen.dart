import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/weather_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WeatherWidget(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
                    const Text('Quên Mật Khẩu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Nhập email của bạn để nhận hướng dẫn đặt lại mật khẩu.', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                CustomTextField(controller: _emailController, hintText: 'email'),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Gửi Yêu Cầu',
                  onPressed: () async {
                    // Gọi hàm giả lập từ AuthService
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đã gửi email hướng dẫn!')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}