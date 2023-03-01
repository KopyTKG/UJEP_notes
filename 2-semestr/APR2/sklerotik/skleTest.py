import unittest

from sklerotik import Sklerotik

class SkelTesting(unittest.TestCase):
    def setUp(self):
        self.skel = Sklerotik(4)
    
    def test_capacity(self):
        self.assertEqual(self.skel.capacity, 4)

    def test_add(self):
        for item in range(0, 10):
            self.skel.add(f"item{item}")
        if len(self.skel.memory) > self.skel.capacity:
            raise Exception("overflow")
            
        print(repr(self.skel))

if __name__ == '__main__':
    unittest.main()
