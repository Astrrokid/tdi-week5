#!/bin/bash

report_dir="reports"
results_file="$report_dir/baseline_model_results.csv"
output_report="$report_dir/baseline_model_report.md"
branch_name="compare-result"

# Check if report directory and results file exist
[ ! -d "$report_dir" ] && echo "Error: Report directory not found." && exit 1
[ ! -f "$results_file" ] && echo "Error: Results file not found." && exit 1

# Find best model by F1-score
best_model=$(awk -F',' 'NR>1 {print $0 | "sort -t, -k3 -nr"}' "$results_file" | head -n 1)
data_version=$(echo "$best_model" | awk -F',' '{print $1}')
model_name=$(echo "$best_model" | awk -F',' '{print $2}')
f1_score=$(echo "$best_model" | awk -F',' '{print $3}')
accuracy=$(echo "$best_model" | awk -F',' '{print $4}')
confusion_matrix_image="${data_version}_${model_name}_confusion_matrix.png"

# Generate report
{
    echo "# Baseline Model Report"
    echo "## Best Model Summary"
    echo "- **Data Version**: $data_version"
    echo "- **Model Name**: $model_name"
    echo "- **F1-Score**: $f1_score"
    echo "- **Accuracy**: $accuracy"
    echo "### Confusion Matrix"
    echo "![Confusion Matrix]($confusion_matrix_image)"
} > "$output_report"

# Commit and push report
git checkout -b "$branch_name"
git add "$output_report"
git commit -m "Add baseline model report for best model"
git push origin "$branch_name"

echo "Create a pull request to merge '$branch_name' into 'main'."
echo "After merging, retain only the best model report and associated files in 'main'."
