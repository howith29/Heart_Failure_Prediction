# Heart Failure Prediction - Experiment Summary

## 1. Research Purpose
- Predict mortality risk in heart failure patients using clinical data.
- Develop machine learning models to enable early detection and management.
- Compare model performance across different balancing strategies (Train-only SMOTE vs Full SMOTE).
- Identify the most effective and generalizable predictive model.

## 2. Background

Heart failure (HF) is a condition where the heart cannot pump enough blood to meet the body's needs, leading to serious complications such as arrhythmias, organ failure, and sudden death.  
According to the Korean Heart Failure Fact Sheet 2022, the prevalence of HF in Korea increased from 0.77% in 2002 to 2.58% in 2020, with mortality rising from 3.0 to 15.6 per 100,000 people [1].  
As HF advances, multi-organ dysfunction may require heart and multi-organ transplantation. Early prediction is crucial for timely treatment, complication prevention, and healthcare cost reduction, highlighting the need for machine learning-based risk prediction models.  
- - -
[1] The Korean Society of Heart Failure, "2022 Korean Heart Failure Fact Sheet," 2022. [Online]. Available: https://www.kshf.or.kr

## 3. Related Work
Previous studies have demonstrated the effectiveness of machine learning models for predicting heart failure.  
- **Alotaibi (2019)** [2]:  
  Applied five ML models to a heart disease dataset; Decision Tree achieved the highest accuracy (93.19%).
- **Lee (2022)** [3]:  
  Used a heart failure clinical record dataset; tree-based models (LGBM, Random Forest) showed superior performance (LGBM accuracy: 96.76%).  
Both studies highlight that tree-based models generally outperform regression-based approaches in heart failure prediction, motivating this study to focus on Decision Tree, Random Forest, LGBM, Logistic Regression, and SVM.
- - -
**References**  
[2] Fahd Saleh Alotaibi, "Implementation of Machine Learning Model to Predict Heart Failure Disease," *International Journal of Advanced Computer Science and Applications (IJACSA)*, Vol. 10, No. 6, 2019.  
[3] HeeJeong Jasmine Lee, "Comparative Study on Prediction of Mortality in Heart Failure Patients using Nine Machine Learning Algorithms," *Journal of KIIT*, Vol. 20, No. 9, pp. 105-114, 2022.

## 4. Data Source and Citation
- Dataset: [Heart Failure Clinical Records](https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data) (Kaggle)  
- License: CC BY 4.0  
**Acknowledgement**: Davide Chicco & Giuseppe Jurman  
**Citation**: Chicco & Jurman, BMC Medical Informatics and Decision Making (2020)  

## 5. Experimental Design
- Train-only SMOTE: Applied SMOTE only on training set, evaluated on original test set
- Full SMOTE: Applied SMOTE to the entire dataset before splitting
- Models: LogisticRegression, DecisionTree, RandomForest, LightGBM, ANN, SVM

## 6. Preprocessing
- No missing values were found in the dataset, so no imputation was needed.  
- Significant features related to DEATH_EVENT were selected using statistical analysis (R).  
- Based on statistical significance (p < 0.05)  
  
The selected features were:  
- age
- ejection_fraction
- serum_creatinine
- serum_sodium
- time  

Additional variables like creatinine_phosphokinase and platelets were explored for clinical understanding but were not included in model training.

## 7. Hypotheses
- Simple linear models may perform competitively in binary classification
- Tree-based models will perform better (as shown in prior studies)
- SMOTE application scope affects model advantage
- Selecting key features improves performance

## 8. Evaluation Metrics
- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC

## 9. Results
**Main experiment (Train-only SMOTE):**  
- Best AUC: Logistic Regression (0.8689), followed by RandomForest and LightGBM
- SVM had highest accuracy (0.80), but lower AUC

**Sub experiment (Full SMOTE):**
- Best AUC: RandomForest (0.9405), followed by ANN and LightGBM
- Overall performance of tree-based models improved significantly under full SMOTE

## 10. Conclusion
- Tree-based models (RandomForest, LightGBM) showed strong performance
- SMOTE application scope significantly impacts model rankings
- Logistic Regression was competitive in the original (imbalanced) setting
- RandomForest was the most stable top-performer across both experiments


