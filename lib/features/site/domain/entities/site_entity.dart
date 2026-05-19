class SiteEntity {
  SiteEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.fullName,
    this.logo,
    this.logoFullSizeUrl,
    required this.address,
    this.phoneNumber,
    required this.email,
    required this.currency,
  });

  final int id;
  final String code;
  final String name;
  final String fullName;
  final String? logo;
  final String? logoFullSizeUrl;
  final String address;
  final String? phoneNumber;
  final String email;
  final String currency;
}
