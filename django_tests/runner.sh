# We need to wrap the runtests.py so that
# - all stderr output is redirected to stdout as otherwise the green metric tool (GMT) thinks there is an error
# - return true at the end as the runtests returns -1 if something failed and we don't want the GMT to fail because a test failed
python runtests.py --noinput 2>&1 || true