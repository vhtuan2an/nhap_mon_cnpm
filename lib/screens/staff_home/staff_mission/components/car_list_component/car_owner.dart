class CarOwner {
  final int stt;
  final String licensePlate;
  final String carBrand;
  final String ownerName;
  final int debt;

  const CarOwner({
    required this.stt,
    required this.licensePlate,
    required this.carBrand,
    required this.ownerName,
    required this.debt,
  });

  CarOwner copy({
    String? licensePlate,
    String? carBrand,
    String? ownerName,
    int? debt,
  }) =>
      CarOwner(
        stt: stt ?? this.stt,
        licensePlate: licensePlate ?? this.licensePlate,
        carBrand: carBrand ?? this.carBrand,
        ownerName: ownerName ?? this.ownerName,
        debt: debt ?? this.debt,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CarOwner &&
              runtimeType == other.runtimeType &&
              stt == other.stt &&
              licensePlate == other.licensePlate &&
              carBrand == other.carBrand &&
              ownerName == other.ownerName &&
              debt == other.debt;

  @override
  int get hashCode =>
      stt.hashCode ^ licensePlate.hashCode ^ carBrand.hashCode ^ ownerName.hashCode ^ debt.hashCode;
}