class Chat {
  String fromcontactName;
  String tocontactName;
  String message;
  String time;
  String imgUrl;

  Chat({
    this.fromcontactName,
    this.tocontactName,
    this.imgUrl,
    this.message,
    this.time,
  });
}
List<Chat> chats = [
  Chat(fromcontactName: "Jake", imgUrl: "",tocontactName: "Veroh", time: '12:00 pm', message: "Hello. How are you"),
  Chat(fromcontactName: "Veroh", imgUrl: "",tocontactName: "Jake", time:'12:01 pm', message: "Meet me there"),
  Chat(fromcontactName: "Dann", imgUrl: "",tocontactName: "Jake", time: '13:00 pm', message: "Hello. How are you"),
  Chat(fromcontactName: "Amos", imgUrl: "",tocontactName: "Jake", time: '14:00 pm', message: "I saw him yesterday"),
  Chat(fromcontactName: "Steve", imgUrl: "",tocontactName: "Jake", time: '16:00 pm', message: "Listen to her, she's always right"),
  Chat(fromcontactName: "Jake", imgUrl: "",tocontactName: "Amos", time: '12:00 pm', message: "Hello. How are you"),
  Chat(fromcontactName: "Jake", imgUrl: "",tocontactName: "Amos", time: '12:01 pm', message: "Meet me there"),
  Chat(fromcontactName: "Dann", imgUrl: "",tocontactName: "Jake", time: '13:00 pm', message: "Hello. How are you"),
  Chat(fromcontactName: "Jake", imgUrl: "",tocontactName: "Veroh", time: '14:00 pm', message: "I saw him yesterday"),
  Chat(fromcontactName: "Steve", imgUrl: "",tocontactName: "Jake", time: '16:00 pm', message: "Listen to her, she's always right"),
];
