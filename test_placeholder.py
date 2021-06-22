import pytest


@pytest.fixture(params=range(0,100))
def test_number(request):
    yield request.param


def test_pass(test_number):
    print('Intentional pass #{}'.format(test_number))


@pytest.mark.failure
def test_failure():
    print('Intentional failure')
    assert False is True

