class Chat {
  String contactName;
  String message;
  String time;
  String imgUrl;

  Chat({
    this.contactName,
    this.imgUrl,
    this.message,
    this.time,
  });
}
List<Chat> chats = [
  Chat(contactName: "Jake", imgUrl: '', time: '12:00 pm', message: "Hello. How are you"),
  Chat(contactName: "Veroh", imgUrl: '', time: '12:01 pm', message: "Meet me there"),
  Chat(contactName: "Dann", imgUrl: '', time: '13:00 pm', message: "Hello. How are you"),
  Chat(contactName: "Amos", imgUrl: '', time: '14:00 pm', message: "I saw him yesterday"),
  Chat(contactName: "Steve", imgUrl: '', time: '16:00 pm', message: "Listen to her, she's always right"),
];
