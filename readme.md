## Installing for Window
1.  Install Python
To install python, go to python official site − https://www.python.org/downloads/ and download the latest version or the prior version of python as per your operating system (Windows).
2.  Install packages
*   Go to root folder (nopCommerce)
*   Open Terminal, then run command:
    *   pip install --upgrade -r ./requirements.txt
3.  Prepare testing data:
    The nopCommerce website will be reset every hour, therefore it is necessary to run the command below for preparing test accounts.
    *   robot -d results ./resources/prepare_users.robot

## Test execution on Window
1.   Run all tests:
    `robot <path_to_testcases_folder>`
    `e.g: robot testcases`

2.   Run test file:
    `robot <path_to_test_file>`
    `e.g: robot testcases/login.robot`

3.   Run single testcase:
    `robot -t "<testcase_name>"   <path_to_test_file>`
    `e.g: robot -t "Successfully logged in" testcases/login.robot`