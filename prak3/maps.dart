void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  // print(gifts);
  // print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts.addAll({'nim': 2341720197, 'nama': 'Rocky Alessandro Kristanto'});
  nobleGases.addAll({3: 2341720197, 4: 'Rocky Alessandro Kristanto'});
  mhs1.addAll({'nim': '2341720197', 'nama': 'Rocky Alessandro Kristanto'});
  mhs2.addAll({1: '2341720197', 2: 'Rocky Alessandro Kristanto'});

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
