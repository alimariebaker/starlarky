"""Unit tests for larky.star."""
load("@stdlib//larky", "larky")
load("@stdlib//unittest", "unittest")
load("@vendor//asserts",  "asserts")


def _test_namespace_exposes_larky_builtins():
    """
    This unit test really is testing to make sure that we are tracking
    that everything we need exported from `@stdlib/larky` to ensure that
    we do not break dependencies.

    :return: None
    """
    items = sorted(dir(larky))
    asserts.assert_that(items).is_length(16)
    asserts.assert_that(items).is_equal_to(sorted([
        "SENTINEL",
        "mutablestruct",
        "partial",
        "property",
        "struct",
        "to_dict",
        "WHILE_LOOP_EMULATION_ITERATION",
        "parametrize",
        "is_instance",
        "translate_bytes",
        "strings",
        "utils",
        "__dict__",
        "impl_function_name",
        "DeterministicGenerator",
        "dicts",
    ]))


def _suite():
    _suite = unittest.TestSuite()
    for t in [
        _test_namespace_exposes_larky_builtins,
    ]:
        _suite.addTest(unittest.FunctionTestCase(t))
    return _suite


_runner = unittest.TextTestRunner()
_runner.run(_suite())