import argparse as ap
def main():
    parser = ap.ArgumentParser(description='Repository Manager')
    subparsers = parser.add_subparsers(help='sub-command help', dest="command")
    subparsers.required = True

    build_parser = subparsers.add_parser('build', help='build help')
    build_parser.add_argument('--version', help='version to build, as provided in the versions database', action='store')
    build_parser.add_argument('repo', help='name of the repo to build', action='store')

    remove_parser = subparsers.add_parser('remove', help='remove: destroy specific version of a repo\'s buil')
    remove_parser.add_argument('repo', help='name of the repo to remove', action='store')
    remove_parser.add_argument('version', help='version to remove, as provided in the versions database', action='store')

    remove_all_parser = subparsers.add_parser('remove-all', help='remove: destroys all builds of some repos')
    remove_all_parser.add_argument('repo', help='name of the repo to completely remove', action='store')

    nuke_parser = subparsers.add_parser('nuke', help='destroy all builds of all repos')

    build_all = subparsers.add_parser('build-all', help='build all repos to their default version')

    show_versions_parser = subparsers.add_parser('show_versions', help='show the available versions for a given repo')
    show_versions_parser.add_argument('repo', help='name of the repo to show the available versions of', action='store')

    args = parser.parse_args()

if __name__ == "__main__":
    main()