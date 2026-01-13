import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin cá nhân')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== HEADER =====
            Card(
              color: Colors.blue.shade400,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Text(
                        user.hoTen.isNotEmpty
                            ? user.hoTen[0].toUpperCase()
                            : 'S',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.hoTen.isNotEmpty
                          ? user.hoTen
                          : 'Chưa cập nhật tên',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'MSV: ${user.msv ?? "N/A"}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== THÔNG TIN SINH VIÊN =====
            _buildInfoCard(
              Icons.person,
              'Thông tin sinh viên',
              {
                'Mã sinh viên': user.msv ?? 'N/A',
                'Họ và tên': user.hoTen,
                'Email': user.email,
                'Ngày sinh': user.ngaySinh,
                'Giới tính': user.gioiTinh,
              },
            ),

            const SizedBox(height: 16),

            // ===== THÔNG TIN LỚP =====
            _buildInfoCard(
              Icons.class_,
              'Thông tin lớp',
              {
                'Mã lớp': user.maLop,
                'Tên lớp': user.tenLop,
                'Hệ đào tạo': user.heDaoTao,
                'Niên khóa': user.nienKhoa,
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title,
    Map<String, String> data,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(),
            ...data.entries.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.key,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Flexible(
                      child: Text(
                        e.value,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
