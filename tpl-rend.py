#!/usr/bin/env python

import argparse
import os
import re


def get_args():
    parser = argparse.ArgumentParser(description="Simple template renderer using environment variables")
    parser.add_argument("-t", "--tpl-file", help="Template file to render")
    parser.add_argument("-o", "--output-file", help="Output file")

    return parser.parse_args()


def main():
    args = get_args()
    t = open(args.tpl_file, "r").read()
    tpl_vars = re.findall("{{.+?}}", t)
    for v in tpl_vars:
        vv = v.strip("}{")
        if vv in os.environ:
            t = t.replace(v, os.environ[vv])
    open(args.output_file, "w").write(t)


if __name__ == '__main__':
    main()
