# Download Python
curl https://www.python.org/ftp/python/3.10.1/python-3.10.1-amd64.exe --output python-3.10.1-amd64.exe;
# Install it to a predefined location
./python-3.10.1-amd64.exe /passive InstallAllUsers=0 PrependPath=1 Include_test=0 TargetDir=$HOMEDRIVE$HOMEPATH\\python310;

# Install virtualenv on the python installation
$HOMEDRIVE$HOMEPATH\\python310\\python.exe --version
$HOMEDRIVE$HOMEPATH\\python310\\python.exe -m pip install virtualenv

# Remove any old version of rpc-slave, and clone the latest release
rm -rf rpc-slave/
git clone https://github.com/akselbor/rpc-slave.git

# Install rustup. Note: it seems we that we need to run the installer in order for rustc/cargo to be
# available from CMD for maturin.
curl https://win.rustup.rs/x86_64 --output rustup-init.exestart rustup-init.exe -y

# Move into the rpc-slave director
cd rpc-slave

# Create and activate a virtual environment
$HOMEDRIVE$HOMEPATH\\python310\\python.exe -m virtualenv venv
source ./venv/Scripts/activate

# Install the requirements
python --version
pip install -r requirements.txt

# Start the slave node using this as the master node
python main.py --master http://10.24.26.243:5000

# Left here during testing to keep the command prompt open
read -p "test" hello