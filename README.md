# Heart Failure Prediction - README

> *This study was conducted as part of an undergraduate thesis project.*

## 📌 Overview
This project aims to predict mortality risk in heart failure patients using clinical data and to compare multiple machine learning models to identify the best-performing model.

## 📂 File Information
| File Name | Description |
|:---|:---|
| `heart_failure_preprocessing` | Data preprocessing (R) |
| `heart_failure_final` | Main experiment (Train-only SMOTE) |
| `heart_failure_SMOTE` | Sub experiment (Full SMOTE, to be added) |
| `experiment_summary.md` | Detailed experimental design and results summary |

## ⚙️ Models Used
- RandomForestClassifier
- LogisticRegression
- DecisionTreeClassifier
- SVC (with probability=True)
- LightGBM (LGBMClassifier)
- MLPClassifier (ANN)

## 📊 Evaluation Metrics
- Accuracy
- Precision
- Recall
- F1-score
- ROC Curve and AUC
  
## 🔖 Summary
- Main experiment: Applied SMOTE only to the training set to reflect real-world evaluation conditions.
- Sub experiment: Applied SMOTE to the entire dataset before splitting to observe the performance changes.

Detailed results and full explanations are provided in `experiment_summary.md`.

## 📈 Results Overview





## **📚 Data Source and Citation**
- This project uses the [Heart Failure Clinical Records dataset] from Kaggle.  
  (https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data)  
- Provider: Andrew Mvd  
- License: CC BY 4.0

**Acknowledgements**  
- Dataset based on the research by Davide Chicco and Giuseppe Jurman
  
**Citation**  
Davide Chicco, Giuseppe Jurman.  
*Machine learning can predict survival of patients with heart failure from serum creatinine and ejection fraction alone.*  
BMC Medical Informatics and Decision Making, 20, 16 (2020).
[Paper Link](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-020-1023-5)

