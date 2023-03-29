## Installing for Window
1.  Install Python
To install python, go to python official site − https://www.python.org/downloads/ and download the latest version or the prior version of python as per your operating system (Windows).
2.  Setting Path for Window  (*Required Administrator right)
*   Open Search on Window (alternative: press the Window key)
*   Search for "Edit the system environment variables"
*   Open the "Edit the system environment variables" window
*   Under System Variables, find and select the Path variable
*   Click Edit
*   Add path of the directories `/Python/` and `/Python/Scripts/` into the Path variable
*   Save changes
3.  Install packages
*   Go to root folder (robot_nopCommerce)
*   Open Terminal, then run command:
    *   pip install --upgrade -r ./requirements.txt


## Folder structure
1. `/browser/`
Contains keywords that handle browser window.
2. `/constant/`
Contains constant variables.
3. `/page_objects/`
Contains reusable keywords that are relevant to each pages.
4.  `/page_objects/web_locators/`
Contains web locators, grouped by page.
5. `/test_data/`
Contains data for testing.
6. `/testcases/`
Contains all test cases, grouped by feature.
7. `/utils/`
Contains utility functions or modules that are used across multiple parts of the project.
8. `./env_conf.py`
Contains the information for project's environment.

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

4.  Run test then storage the output files in a specific directory:
    `robot -d <output_dir> <path_to_test_file>`
    `e.g: robot -d results testcases/login.robot`