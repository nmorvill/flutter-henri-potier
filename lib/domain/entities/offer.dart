enum OfferType{
  percentage,
  minus,
  slice
}

class Offer{
  final OfferType type;
  final double value;
  final double? sliceValue;

  const Offer({
    required this.type,
    required this.value,
    this.sliceValue
  });

}