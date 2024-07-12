class CardModel {
  // Thuộc tính lưu trữ đường dẫn hình ảnh hoặc định danh của thẻ
  final String identifier;
  
  // Thuộc tính xác định xem thẻ có đang được lật lên hay không
  bool isFlipped;
  
  // Thuộc tính xác định xem thẻ có được ghép đôi hay không
  bool isMatched;

  // Constructor của lớp CardModel, yêu cầu identifier và có giá trị mặc định cho isFlipped và isMatched
  CardModel({
    required this.identifier, // Thuộc tính này bắt buộc phải được cung cấp khi khởi tạo đối tượng
    this.isFlipped = false, // Mặc định thẻ chưa được lật
    this.isMatched = false, // Mặc định thẻ chưa được ghép đôi
  });
}
