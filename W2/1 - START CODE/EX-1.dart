
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String   _city;
  final String _zipCode;

  Address({
    required this._street,
    required this._city,
    required this._zipCode,
  });
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = (skills),
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = 40000,
        _skills = const[Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  String get name {
    return _name;
  }

  double get baseSalary {
    return _baseSalary;
  }

  List<Skill> get skills {
    return _skills;
  }

  Address get address {
    return _address;
  }

  int get yearsOfExperience {
    return _yearsOfExperience;
  }
  
  double computeSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$$_baseSalary');
    print('Skills: $_skills');
    print('Address: ${_address._street}, ${_address._city}, ${_address._zipCode}');
    print('Years of Experience: $_yearsOfExperience');
    print('Total Salary: \$${computeSalary()}');
    print('----------------------------');
  }
}

void main() {
  Address address1 = Address(
    street: 'Street 2004',
    city: 'Phnom Penh',
    zipCode: '12000',
  );

  Employee emp1 = Employee(
    name: 'Sokea',
    baseSalary: 40000,
    skills: [Skill.FLUTTER, Skill.OTHER],
    address: address1,
    yearsOfExperience: 3,
  );

  emp1.printDetails();

  Employee emp2 = Employee.mobileDeveloper(
    name: 'Ronan',
    address: Address(
      street: 'Street 100',
      city: 'Phnom Penh',
      zipCode: '12000',
    ),
    yearsOfExperience: 5,
  );

  emp2.printDetails();
}
