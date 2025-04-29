# Heart Failure Prediction

> *This study was conducted as part of an undergraduate thesis project.*

## 📌 Overview
This project aims to predict mortality risk in heart failure patients using clinical data and to compare multiple machine learning models to identify the best-performing model.

## 📂 File Information
| File Name | Description |
|:---|:---|
| `heart_failure_preprocessing` | Data preprocessing (R) |
| `heart_failure_final` | Main experiment (Train-only SMOTE) |
| `heart_failure_SMOTE` | Sub experiment (Full SMOTE) |
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

Detailed results and full explanations are provided in `experiment_summary.md`

## 📈 Results Overview

- main experiment
<img src="https://github.com/user-attachments/assets/854a1607-8136-4f1d-9dc5-780d94fe62f3" width="500"/>

```
               Model  Accuracy  Precision    Recall  F1-score       AUC
0  LogisticRegression  0.755556   0.682927  0.756757  0.717949  0.868944
1        RandomForest  0.744444   0.705882  0.648649  0.676056  0.846507
2            LightGBM  0.755556   0.727273  0.648649  0.685714  0.831719
3                 ANN  0.711111   0.666667  0.594595  0.628571  0.813361
4                 SVM  0.800000   0.851852  0.621622  0.718750  0.775625
5        DecisionTree  0.666667   0.620690  0.486486  0.545455  0.606578
```

- sub experiment
<img src="https://github.com/user-attachments/assets/5e694523-1025-443c-b7e1-2b2d688daf54" width="500"/>
  
```
               Model  Accuracy  Precision    Recall  F1-score       AUC
0        RandomForest  0.877049   0.878788  0.892308  0.885496  0.940486
1                 ANN  0.836066   0.894737  0.784615  0.836066  0.926586
2            LightGBM  0.836066   0.846154  0.846154  0.846154  0.911201
3  LogisticRegression  0.770492   0.813559  0.738462  0.774194  0.882591
4        DecisionTree  0.770492   0.849057  0.692308  0.762712  0.880972
5                 SVM  0.762295   0.800000  0.738462  0.768000  0.876653
```
- - -


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

