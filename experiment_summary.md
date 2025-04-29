# Heart Failure Prediction - Experiment Summary

※ This study was conducted as part of an undergraduate thesis project.

## 1. Research Purpose
- Predict mortality risk in heart failure patients using clinical data.
- Develop machine learning models to enable early detection and management.
- Compare model performance across different balancing strategies (Train-only SMOTE vs Full SMOTE).
- Identify the most effective and generalizable predictive model.

## 2. Key Results Summary

- **Train-only SMOTE** : Logistic Regression achieved the best AUC (0.8689).
- **Full SMOTE** : Random Forest achieved the best AUC (0.9405).
Tree-based models showed superior performance, particularly after full SMOTE application.

- - -

## 3. Background
Heart failure (HF) is a condition where the heart cannot pump enough blood to meet the body's needs, leading to serious complications such as arrhythmias, organ failure, and sudden death.  
According to the Korean Heart Failure Fact Sheet 2022, the prevalence of HF in Korea increased from 0.77% in 2002 to 2.58% in 2020, with mortality rising from 3.0 to 15.6 per 100,000 people [1].  
As HF advances, multi-organ dysfunction may require heart and multi-organ transplantation. Early prediction is crucial for timely treatment, complication prevention, and healthcare cost reduction, highlighting the need for machine learning-based risk prediction models.  

## 4. Related Work
Previous studies have demonstrated the effectiveness of machine learning models for predicting heart failure.  
- **Alotaibi (2019)** [2]:  
  Applied five ML models to a heart disease dataset; Decision Tree achieved the highest accuracy (93.19%).
- **Lee (2022)** [3]:  
  Used a heart failure clinical record dataset; tree-based models (LGBM, Random Forest) showed superior performance (LGBM accuracy: 96.76%).

Both studies highlight that tree-based models generally outperform regression-based approaches in heart failure prediction, motivating this study to focus on Decision Tree, Random Forest, LGBM, Logistic Regression, and SVM.

## 5. Data Source and Citation
- Dataset: [Heart Failure Clinical Records](https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data) (Kaggle)  
- License: CC BY 4.0  
**Acknowledgement**: Davide Chicco & Giuseppe Jurman  
**Citation**: Chicco & Jurman, BMC Medical Informatics and Decision Making (2020)  

## 6. Experimental Design
This study aimed to identify the optimal machine learning model for predicting heart failure mortality. Two experimental setups were designed to evaluate model performance under different data balancing strategies:

- **Train-only SMOTE**: SMOTE was applied only to the training set to maintain the original class distribution in the test set, reflecting real-world scenarios.
- **Full SMOTE**: SMOTE was applied to the entire dataset before splitting to create a fully balanced dataset, allowing models to learn from equally distributed classes.

Models compared: Logistic Regression, Decision Tree, Random Forest, LightGBM, ANN, and SVM.

## 7. Preprocessing
- No missing values were found in the dataset.
- Significant features related to DEATH_EVENT were selected using R-based statistical analysis.
- Final features used for model training:
    - age
    - ejection_fraction
    - serum_creatinine
    - serum_sodium
    - time
- Additional features such as creatinine_phosphokinase and platelets were explored for clinical interpretation but not used in training.

## 8. Hypotheses
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
- Best AUC: Logistic Regression (0.8689), followed by RandomForest and LightGBM.
- SVM had highest accuracy (0.80), but lower AUC compared to tree-based models.
**Sub experiment (Full SMOTE):**
- Best AUC: RandomForest (0.9405), followed by ANN and LightGBM.
- Overall performance of tree-based models improved significantly under full SMOTE.


- main experiment

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

```
               Model  Accuracy  Precision    Recall  F1-score       AUC
0        RandomForest  0.877049   0.878788  0.892308  0.885496  0.940486
1                 ANN  0.836066   0.894737  0.784615  0.836066  0.926586
2            LightGBM  0.836066   0.846154  0.846154  0.846154  0.911201
3  LogisticRegression  0.770492   0.813559  0.738462  0.774194  0.882591
4        DecisionTree  0.770492   0.849057  0.692308  0.762712  0.880972
5                 SVM  0.762295   0.800000  0.738462  0.768000  0.876653
```


## 10. Conclusion
- Tree-based models (RandomForest, LightGBM) showed strong performance.
- SMOTE application scope significantly impacts model rankings.
- Logistic Regression was competitive under imbalanced conditions.
- RandomForest was the most stable top-performer across both experimental setups.

- - -
## References
[1] The Korean Society of Heart Failure, "2022 Korean Heart Failure Fact Sheet," 2022. [Online]. Available: https://www.kshf.or.kr  
[2] Fahd Saleh Alotaibi, "Implementation of Machine Learning Model to Predict Heart Failure Disease," *International Journal of Advanced Computer Science and Applications (IJACSA)*, Vol. 10, No. 6, 2019.    
[3] HeeJeong Jasmine Lee, "Comparative Study on Prediction of Mortality in Heart Failure Patients using Nine Machine Learning Algorithms," *Journal of KIIT*, Vol. 20, No. 9, pp. 105-114, 2022.  

