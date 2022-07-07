import 'package:flutter_test/flutter_test.dart';
import 'package:pets/src/shared/utils/validator.dart';

void main() {
  final validator = Validator();

  test('Name is not null', () {
    String name = validator.nameValidator('')!;
    expect(name, 'Name is required!');
  });

  test('Email is not null', () {
    String email = validator.emailValidator('')!;
    expect(email, 'Enter Your Email');
  });

  test('Invalid email', () {
    String invalidEmail = validator.emailValidator('teste.com')!;
    expect(invalidEmail, 'Invalid email');
  });

  test('Login password is valid', () {
    String loginPassword = validator.loginPasswordValidator('')!;
    expect(loginPassword, 'Enter Your Password');
  });
  test('SignUp password is valid', () {
    String signUpPassword = validator.signUpPasswordValidator('', '')!;
    expect(signUpPassword, 'Password is required!');
  });
  test('SignUp passwords don\'t math', () {
    String signUpPassword =
        validator.signUpPasswordValidator('1234567', '123456')!;
    expect(signUpPassword, 'passwords don\'t match');
  });
  test('SignUp password is short', () {
    String signUpPassword =
        validator.signUpPasswordValidator('12345', '12345')!;
    expect(signUpPassword, 'Password must be 6-32 characters');
  });
  test('Pet name is not null', () {
    String petName = validator.petNameValidator('')!;
    expect(petName, 'Enter Your Pet Name');
  });
  test('Pet type is not null', () {
    String type = validator.typeValidator('')!;
    expect(type, 'Enter Your Pet Type');
  });
  test('gender is not null', () {
    String gender = validator.genderValidator('')!;
    expect(gender, 'Enter Your Pet Gender');
  });
  test('Pet weight is not null', () {
    String petWeight = validator.weightValidator('')!;
    expect(petWeight, 'Enter Your Pet Weight');
  });
  test('Pet weight is valid', () {
    String petWeight = validator.weightValidator('A')!;
    expect(petWeight, 'Only Digits Accepted');
  });
  test('Pet age is not null', () {
    String petAge = validator.ageValidator('')!;
    expect(petAge, 'Enter Your Pet Age');
  });
  test('Pet age is valid', () {
    String petAge = validator.weightValidator('A')!;
    expect(petAge, 'Only Digits Accepted');
  });
  test('Post description is not null', () {
    String description = validator.descriptionValidator('')!;
    expect(description, 'Enter a Description');
  });
  test('Post comment is not null', () {
    String comment = validator.commentValidator('')!;
    expect(comment, 'Enter Your Comment');
  });
}
