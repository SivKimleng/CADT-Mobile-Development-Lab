
class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;

  BankAccount({
    required this.accountId,
    required this.accountOwner,
  }) : _balance = 0;

  double get balance {
    return _balance;
  }

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0!');
    }

    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0!');
    }

    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }

    _balance -= amount;
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (BankAccount account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    BankAccount newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );

    _accounts.add(newAccount);

    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance);

  ronanAccount.credit(100);
  print(ronanAccount.balance);

  ronanAccount.withdraw(50);
  print(ronanAccount.balance);

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Honlgy');
  } catch (e) {
    print(e);
  }
}
