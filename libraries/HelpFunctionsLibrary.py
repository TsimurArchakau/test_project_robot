import json
import random
import string
from faker import Faker
from robot.api.deco import keyword


class HelpFunctionsLibrary:
    @keyword
    def generate_random_password(self):
        uppercase_letter = random.choice(string.ascii_uppercase)
        lowercase_letter = random.choice(string.ascii_lowercase)
        special_char = random.choice('!@#$%^&*()-_+.<>?')
        digits = ''.join(random.choice(string.digits) for _ in range(5))
        symbols_list = [uppercase_letter, lowercase_letter, special_char, digits]
        password = ''.join(symbols_list)
        return password

    @keyword
    def generate_random_data(self):
        fake = Faker()
        email = fake.email()
        password = self.generate_random_password()
        first_name = fake.first_name()
        last_name = fake.last_name()
        phone_number = ''.join(random.choice(string.digits) for _ in range(9))
        return email, password, first_name, last_name, phone_number

    @keyword
    def save_credentials(self, email, password):
        credentials = {'email': email, 'password': password}
        with open('variables/user_credentials.json', 'w') as file:
            json.dump(credentials, file)

    @keyword
    def load_credentials(self):
        with open('variables/user_credentials.json', 'r') as file:
            credentials = json.load(file)
        return credentials['email'], credentials['password']
