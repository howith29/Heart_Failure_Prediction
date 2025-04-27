# Heart Failure Prediction

## ✨ Research Purpose
- Heart Failure Clinical Records 데이터세트 기반
- 다양한 머신러닝 모(RandomForest, LogisiticRegression, LightGBM, ANN 등)을 비교
- 가장 적합한 예측 모델 도출

## Experiment Versions
| Version | Description | Purpose | Note |
|-----|-----|-----|----|
| (1) Feature selection | preprocessing using R | Select significant features | 주요 Feature만 선정 |
| (2) Train-Only SMOTE | Main experiment(apply SMOTE only to train) |Follow ML standard | EDA included |
| (3) Full SMOTE | Sub experiment (apply SMOTE to full before split) |For comparison with previous cases|Forcus on perfomance difference of tree-based models(트리 기반 모델 성능 차이 비교|

## 📂 File Management Plan
| File_name | Info |
|---|---|
|heart_failure_preprocessing| Data preprocessing (using R) (데이터 전처리) |
|heart_failure_final | Train-only SMOTE experiment |
|heart_failure_SMOTE | Full SMOTE experiment (to be added) |

## 🔢 Models Used
- RandomForestClassifier
- LogisticRegression
- DecisionTreeClassifier
- SVC (probability=True)
- LightGBM (LGBMClassifier)
- MLPClassifier (ANN)

## 📊 Evaluation Metrics
- Accuracy(정확도)
- Precision(정밀도)
- Recall(재현율)
- F1-score
- ROC Curve + AUC

## Experiment Progress
| Item | Status |
|---|---|
|Train-only SMOTE experiment | Completed |
|Full SMOTE experiment |In progress |

## 📚 Data Source and Citation

- This project uses the [Heart Failure Clinical Records dataset] from Kaggle.  
  (https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data)
- Provider: Andrew Mvd
- License: CC BY 4.0

### Acknowledgements
- Dataset based on the research by Davide Chicco and Giuseppe Jurman

### Citation
Davide Chicco, Giuseppe Jurman.  
*Machine learning can predict survival of patients with heart failure from serum creatinine and ejection fraction alone.*  
BMC Medical Informatics and Decision Making, 20, 16 (2020).  
[Paper Link](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-020-1023-5)
