class TableRow {
  final int stt;
  final String noiDung;
  final String vatTu;
  final int sl;
  final int donGia;
  final int tienCong;
  final int thanhTien;

  const TableRow({
    required this.stt,
    required this.noiDung,
    required this.vatTu,
    required this.sl,
    required this.donGia,
    required this.tienCong,
    required this.thanhTien,
  });

  TableRow copy({
    int? stt,
    String? noiDung,
    String? vatTu,
    int? sl,
    int? donGia,
    int? tienCong,
    int? thanhTien,
  }) =>
      TableRow(
        stt: stt ?? this.stt,
        noiDung: noiDung ?? this.noiDung,
        vatTu: vatTu ?? this.vatTu,
        sl: sl ?? this.sl,
        donGia: donGia ?? this.donGia,
        tienCong: tienCong ?? this.tienCong,
        thanhTien: thanhTien ?? this.thanhTien,
      );

  int? updateThanhTien() {
    return sl * donGia + tienCong;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TableRow &&
              runtimeType == other.runtimeType &&
              stt == other.stt &&
              noiDung == other.noiDung &&
              vatTu == other.vatTu &&
              sl == other.sl &&
              donGia == other.donGia &&
              tienCong == other.tienCong &&
              thanhTien == other.thanhTien;

  @override
  int get hashCode =>
      stt.hashCode ^ noiDung.hashCode ^ vatTu.hashCode ^ sl.hashCode ^ donGia.hashCode ^ tienCong.hashCode ^ thanhTien.hashCode;
}