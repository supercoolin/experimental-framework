from manager_consts import *
import argparse as ap
import json
from subprocess import call
import shlex
import os

def bashrc_add_cfg(cfg):
    home = os.getenv("HOME")
    if home is None:
        print("Could not find user home !")
        return False
    with open(os.path.join(home, ".bashrc"), "r") as f:
        bashrc_lines = f.readlines()
    bashrc_lines += [
        BASHRC_START,
        f"export OOT_INSTALL_DIR_NAME={cfg[CFG_KEY_INSTALL_DIR_NAME]}\n",
        f"export FRAMEWORKS_ROOT={cfg[CFG_KEY_FRAMEWORK_ROOT]}\n",
        BASHRC_STOP
    ]
    with open(os.path.join(home, ".bashrc"), "w") as f:
        f.writelines(bashrc_lines)
    cfg[CFG_KEY_TAMPERED_BASHRC] = True

    return True

def bashrc_rm_cfg(cfg):
    home = os.getenv("HOME")
    if home is None:
        print("Could not find user home !")
        return False
    with open(os.path.join(home, ".bashrc"), "r") as f:
        bashrc_lines = f.readlines()
    start = bashrc_lines.index(BASHRC_START)
    stop = bashrc_lines.index(BASHRC_STOP)
    bashrc_lines = bashrc_lines[:start] + bashrc_lines[stop + 1:]
    with open(os.path.join(home, ".bashrc"), "w") as f:
        f.writelines(bashrc_lines)
    cfg[CFG_KEY_TAMPERED_BASHRC] = False
    return True


def install_deps(cfg):
    if not cfg[CFG_KEY_INSTALLED_DEPS]:
        cfg[CFG_KEY_FRAMEWORK_ROOT] = input("Please enter the absolute path to the root of the experimental framework:\n>")
        cfg[CFG_KEY_INSTALL_DIR_NAME] = input("Please enter the name of the directories in which out of tree builds will be installed:\n>")
        install_cmd_str = f"sudo apt install -y {cfg[CFG_KEY_UBUNTU_DEPS]}"
        install_cmd = shlex.split(install_cmd_str)
        print(f"Running {install_cmd_str} ...")
        ret = call(install_cmd)
        if ret != 0:
            print("Something went wrong while installing the dependencies, quitting...")
            exit(1)
        cfg[CFG_KEY_INSTALLED_DEPS] = True
        print("Dependencies install went successfully !")
        bashrc_add_cfg(cfg)
        print("Wrote .bashrc.")
        print("Saving config...")
        with open("config.json", "w") as f:
            json.dump(cfg, f, indent=4)
        print("Bye.")
    else:
        print("Dependencies already installed !")

def uninstall_deps(cfg):
    print("deiniting FRAMAN...")
    bashrc_rm_cfg(cfg)
    cfg[CFG_KEY_INSTALL_DIR_NAME] = None
    cfg[CFG_KEY_FRAMEWORK_ROOT] = None
    cfg[CFG_KEY_INSTALLED_DEPS] = False
    print("saving cfg file...")
    with open("config.json", "w") as f:
        json.dump(cfg, f, indent=4)
    print("Bye.")
        
def main():
    args, cfg = parse()
    if args.command == CMD_INSTALL_DEPS:
        install_deps(cfg)
    elif args.command == CMD_UNINSTALL_DEPS:
        uninstall_deps(cfg)

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

    uninstall_deps_parser = subparsers.add_parser(CMD_UNINSTALL_DEPS, help='deinit stuff in bashrc and config')

    args = parser.parse_args()

    #load config
    with open("config.json", "r") as f:
        cfg = json.load(f)
    return args, cfg
    
if __name__ == "__main__":
    main()