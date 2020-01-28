from django.test import TestCase
from app.calc import add, subtract


class Calctests(TestCase):
    def test_add_numbers(self):
        """test that two numbers are added together"""
        self.assertEqual(add(3, 8), 11)

    def test_subtract_numbers(self):
        """test that two numbers are subtracted"""
        self.assertEqual(subtract(6, 4), 2)
