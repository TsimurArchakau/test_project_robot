# Hebe: Test Automation Framework
## Hebe web application:

Hebe.pl is a Polish online store specializing in selling cosmetics, perfumes, household chemicals, cleaning products, and other home goods.

For more information please visit www.hebe.pl 


## Test Automation Framework:

This a test automation framework was developed based on the Robot Framework utilizing Selenium library.
It was created according to POM pattern to test main functionality of the online store.

## GitHub Actions:

This project utilizes GitHub Actions for test automation.

### Configuration in GitHub:

Setting up deployment to GitHub pages from GitHub Actions:
- Navigate to *GitHub -> Repository -> Settings -> Pages* and set GitHub Actions as **Source**.

### run_tests.yml file

- **test** job: Runs automated tests and saves test results.

### How to run tests:

- Navigate to *GitHub -> Actions -> Automated tests* and click on **Run workflow**.

Once the test run is complete, a test_result artifact is created. It contains the following files:

- log.html
- output.xml
- report.html

Use them to analyze the test results.

## Running tests locally:

To run tests, follow the steps below:

**1. Clone this repository to your machine:**
```
git clone https://github.com/TsimurArchakau/test_project_robot
```

**2. Create a virtual environment:**
```
python -m venv venv
```

**3. Install project dependencies:**
```
pip install -r requirements.txt
```

**4. Run tests:**
```
robot --outputdir test_results test_cases/
```

**5. Analyze test results:**
```
The following files will be generated in the test_results directory:

- log.html
- output.xml
- report.html

Use them to analyze the test results.
```