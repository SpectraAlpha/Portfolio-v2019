import subprocess
import sys

# This is a python script
# git push --set-upstream <remote_Name> <branch>  
# Add the initialization commands for creating a remote repo. 


def commit(commit_message):       
    try:
        subprocess.run(["git", "add", "."], check=True)
        subprocess.run(["git", "commit", "-m", commit_message], check=True)
        subprocess.run(["git", "push"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)
    print("Updated with Message:"+commit_message)


def git():
    commit_message="Twerk: MinorTwerk"
    try:
        subprocess.run(["git", "add", "."], check=True)
        subprocess.run(["git", "commit", "-m", commit_message], check=True)
        subprocess.run(["git", "push"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)
    print("Quick Update")

if len(sys.argv) < 2:
    print("Usage: py com.py \"commit message\"")
    git()
    sys.exit(1)
else:
    commit_message = sys.argv[1]
    commit(commit_message)



#print("Successfully updated repo")