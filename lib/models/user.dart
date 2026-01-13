class User {
  final String id;
  final String? msv;
  final String email;

  final String? hodem;
  final String? ten;

  final String role;
  final DateTime? createdAt;

  final String maLop;
  final String ngaySinh;
  final String gioiTinh;
  final String tenLop;
  final String heDaoTao;
  final String nienKhoa;

  User({
    required this.id,
    this.msv,
    required this.email,
    this.hodem,
    this.ten,
    required this.role,
    this.createdAt,
    required this.maLop,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.tenLop,
    required this.heDaoTao,
    required this.nienKhoa,
  });

  /// Họ và tên = họ đệm + tên
  String get hoTen {
    final hd = hodem ?? '';
    final t = ten ?? '';
    return '$hd $t'.trim();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      msv: json['msv'],
      email: json['email'] ?? '',
      hodem: json['hodem'],
      ten: json['ten'],
      role: json['role'] ?? 'sinhvien',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      maLop: json['ma_lop'] ?? '',
      ngaySinh: json['ngay_sinh'] ?? '',
      gioiTinh: json['gioi_tinh'] ?? '',
      tenLop: json['ten_lop'] ?? '',
      heDaoTao: json['he_dao_tao'] ?? '',
      nienKhoa: json['nien_khoa'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'msv': msv,
      'email': email,
      'hodem': hodem,
      'ten': ten,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
      'ma_lop': maLop,
      'ngay_sinh': ngaySinh,
      'gioi_tinh': gioiTinh,
      'ten_lop': tenLop,
      'he_dao_tao': heDaoTao,
      'nien_khoa': nienKhoa,
    };
  }

  bool get isAdmin => role == 'admin';
  bool get isSinhVien => role == 'sinhvien';
}
