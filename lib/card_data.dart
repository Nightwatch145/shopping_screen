class CardData
{
  final String name, size, image, color;
  final int price;
  int quantity;
  CardData({required this.name, required this.size, required this.image, required this.color, required this.quantity, required this.price});
}

List<CardData> imageData =
    [
  CardData(
      name:'Pullover',
      size: 'L',
      image: 'https://images.pexels.com/photos/15964668/pexels-photo-15964668/free-photo-of-portrait-of-brunette-man.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      color: 'Black',
       quantity: 1,
    price: 51,
  ),
      CardData(
          name: 'T-Shirt',
          size: 'L',
          image: 'https://images.pexels.com/photos/6311474/pexels-photo-6311474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          color: 'Gray',
          quantity: 1,
          price: 30,
      ),
      CardData(
          name: 'Sport Dress',
          size: 'M',
          image: 'https://images.pexels.com/photos/4770740/pexels-photo-4770740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          color: 'Black',
          quantity: 1,
          price: 43,
      )
    ];