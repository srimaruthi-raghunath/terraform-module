## Instructions to execute using pipeline:
1. Modify [config.yml](https://dev.azure.com/SW4ZF/AZP-112_Discovery/_git/iac-vmss-pool?path=/config.yaml) with values required.<br/>
   *NOTE: DO NOT UPDATE THE VARIABLE NAMES, ONLY UPDATE THE VALUES.*
2. Run the pipeline [iac-vmss-pool](https://dev.azure.com/SW4ZF/AZP-112_Discovery/_build?definitionId=3174)
3. The result is shown in pipeline logs.<br/>

## Instructions to execute manually:
1. Verify that **Python3.6** or above and **pip** is installed in the machine where you are planning to execute the script.
2. Clone this repository.<br/><br/>
   ```git clone -b main https://SW4ZF@dev.azure.com/SW4ZF/AZP-112_Discovery/_git/iac-vmss-pool```<br/><br/>
   *NOTE: Provide git credentials if prompted*
3. Open a bash terminal (or powershell if windows) and navigate to path where the repo is cloned.<br/><br/>
   ```cd <path-to-repo>```<br/><br/>
4. Install required python modules.<br/><br/>
   ```python3 -m pip install -r requirements.txt``` or<br/>
   ```python -m pip install -r requiremets.txt``` depending on your python interpreter and OS.<br/><br/>
5. Modify **config.yaml** file with any text editor.<br/>
   *NOTE: DO NOT UPDATE THE VARIABLE NAMES, ONLY UPDATE THE VALUES.*
6. Set a temporary environment variable with the following command.<br/><br/>
   ```export CONFIG_FILE=config.yml``` for linux/macos bash.<br/>
   ```$env:CONFIG_FILE=config.yml``` for windows powershell.<br/><br/>
7. Execute the pthon code **vmss_pool.py** and pass **personal access token** as an argument.<br/><br/>
   ```python3 vmss_pool.py <personal-access-token>``` or<br/>
   ```python vmss_pool.py <personal-access-token>``` depending on your python interpreter and OS.<br/><br/>
8. The result is shown in logs.