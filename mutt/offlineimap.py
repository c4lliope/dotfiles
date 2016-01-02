#!/usr/bin/python
import re, subprocess
def get_lpass_pass(site=None):
    params = {
        'lpass': '/usr/local/bin/lpass',
        'site': site,
    }
    command = "(/usr/local/bin/lpass ls Email/google.com || /usr/local/bin/lpass login wright.grayson@gmail.com) && /usr/local/bin/lpass show Email/google.com"
    output = subprocess.check_output(command, shell=True)
    outtext = [l for l in output.splitlines()
               if l.startswith('Password: ')][0]

    return re.match(r'Password: (.*)', outtext).group(1)
