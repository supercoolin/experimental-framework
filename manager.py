from manager_consts import *
import argparse as ap
import json
def main():
    args, cfg = parse()
    if args.command == CMD_INSTALL_DEPS:
        print(f"{args.command=}")

def parse():
    parser = ap.ArgumentParser(description='Repository Manager')
    subparsers = parser.add_subparsers(help='sub-command help', dest="command")
    subparsers.required = True

    build_parser = subparsers.add_parser(CMD_BUILD, help='build help')
    build_parser.add_argument('--version', help='version to build, as provided in the versions database', action='store')
    build_parser.add_argument('repo', help='name of the repo to build', action='store')

    remove_parser = subparsers.add_parser(CMD_REMOVE, help='remove: destroy specific version of a repo\'s buil')
    remove_parser.add_argument('repo', help='name of the repo to remove', action='store')
    remove_parser.add_argument('version', help='version to remove, as provided in the versions database', action='store')

    remove_all_parser = subparsers.add_parser(CMD_BUILD_ALL, help='remove: destroys all builds of some repos')
    remove_all_parser.add_argument('repo', help='name of the repo to completely remove', action='store')

    nuke_parser = subparsers.add_parser(CMD_NUKE, help='destroy all builds of all repos')

    build_all_parser = subparsers.add_parser(CMD_BUILD_ALL, help='build all repos to their default version')

    show_versions_parser = subparsers.add_parser(CMD_SHOW_VERSIONS, help='show the available versions for a given repo')
    show_versions_parser.add_argument('repo', help='name of the repo to show the available versions of', action='store')

    install_deps_parser = subparsers.add_parser(CMD_INSTALL_DEPS, help='build all repos to their default version')

    args = parser.parse_args()

    #load config
    with open("config.json", "r") as f:
        cfg = json.load(f)
    return args, cfg
    
if __name__ == "__main__":
    main()