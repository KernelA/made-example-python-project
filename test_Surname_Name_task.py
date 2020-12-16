import pytest

from task_Surname_Name_task import add

def dummy_test():
    assert 1 == 1

def test_add():
    assert 5 == add(2, 3) == add(3, 2)