# Baseline Model Selection Project

## Project Objective

This project aims to automate the selection of a baseline model for a machine learning application, comparing performance metrics across multiple data versions. The goal is to identify the best-performing model based on F1-score and other key metrics, which will then be prepared for deployment to a production or cloud environment. This project was originally implemented in a Jupyter notebook and is now structured with organized directories for effective deployment.

## Project Structure

The repository is structured as follows:

- **report/**: Contains the model performance metrics and outputs.
- **result_comparison.sh**: A Bash script that automates the process of identifying the best baseline model based on F1-score.
- **README.md**: Project documentation (this file).

## Steps Performed

1. **Model Performance Evaluation**:
   - Iterated over results in `baseline_model_results.csv` located in the `report` directory.
   - Selected the model with the highest F1-score as the best-performing baseline model.

2. **Automated Report Generation**:
   - Created a summary report `baseline_model_report.md` with key information:
     - Data version
     - Model name
     - Key performance metrics (F1-score, accuracy, etc.)
     - Confusion matrix image file for the best model
   - Utilized tools like `awk`, `sed`, and `sort` to format and structure data.

3. **Repository Management**:
   - The script automatically commits and pushes `baseline_model_report.md` to the `compare-result` branch.
   - A pull request is submitted to merge `compare-result` into the `main` branch.
   - The final repository includes only the best model's report, its confusion matrix image, and the complete CSV file of results.

## Intended Outcomes

This project enables efficient baseline model selection and provides a clear, structured repository for easy integration into production or cloud environments. The automated script enhances reproducibility and ensures that the best-performing model and relevant metrics are readily accessible in the main branch.
