Pokemon Legendary Classifier Project

Table of Contents
Introduction
Getting the Data
Setting the Scene: Preliminary Exploration
Data Cleaning and Preprocessing
Further Cleaning and Feature Selection
Logistic Regression and Oversampling
Other Binary Classification Models
Conclusion


1. Introduction
This project aims to build a machine learning model to predict whether a Pokemon is legendary or not based on various features. The dataset used for this project contains information about different Pokemon, such as their base stats, abilities, and more. The goal is to develop an accurate and reliable classifier that can distinguish legendary from non-legendary Pokemon.

2. Getting the Data
The first step involves obtaining the dataset, which includes information about Pokemon characteristics and a binary indicator for whether a Pokemon is legendary. The data is loaded using pandas and inspected to understand its structure and content.

3. Setting the Scene: Preliminary Exploration
In this section, we perform preliminary exploration to gain insights into the dataset. We use techniques like Isolation Forest and Hypothesis Testing to identify potential outliers and correlations between features. This step helps us understand the data better before proceeding with the modeling process.

4. Data Cleaning and Preprocessing
Here, we clean the data and preprocess it for modeling. We handle missing values, perform feature extraction, and engineer new features if required. Additionally, we encode categorical variables and split the data into features (X) and the target variable (y).

5. Further Cleaning and Feature Selection
In this step, we conduct further cleaning and feature selection to optimize the feature set for modeling. We use domain knowledge, correlation analysis, and low variance filter techniques to retain only relevant features for training the models.

6. Logistic Regression and Oversampling
In this section, we use logistic regression as our initial binary classification model. Due to class imbalance, we apply oversampling techniques such as SMOTE, RandomOverSampler, and StratifiedKFold Cross Validation. We tune hyperparameters using GridSearchCV to enhance model performance.

7. Other Binary Classification Models
This section explores other binary classification models like KNeighborsClassifier, Decision Tree Classifier, and Gaussian Naive Bayes. We tune hyperparameters and evaluate each model's performance using accuracy, precision, recall, and F1-score.

8. Conclusion
In conclusion, this project builds and evaluates different binary classification models to predict legendary Pokemon. It showcases the effectiveness of logistic regression and other models while considering class imbalance. The evaluation metrics provide insights into the models' performance, helping us identify the most suitable model for the task.



How to Use
To run the project, follow these steps:

Clone the repository to your local machine.
Install the required libraries using pip install.
If you woulld like to open parts of the script separately, make sure to read the designated .csv file located in the each folder.
Before opening the presentation, make sure to install all font files located in the presentation folder beforehand so that tbe presentation appears as intended.
Run the Streamlit app using the command streamlit run project.py.
Feel free to explore the app and make predictions for different Pokemon using the chosen classification model!

Future Improvements
Here are some potential future improvements for my project:

Experiment with more advanced classification models, such as Random Forest or Gradient Boosting, to further enhance prediction accuracy.
Perform more in-depth feature engineering, considering additional Pokemon attributes or external datasets (such a 8th generation Pokemon) to capture more information.
Explore more advanced techniques for handling class imbalance, such as ensemble methods.
Conduct a thorough error analysis to identify misclassifications and improve the model's performance -- for example, optimizing the GaussianNB model.
Create a more interactive and user-friendly interface for the Streamlit app, allowing users to input custom Pokemon attributes for prediction.
Building a Legendary Pokemon Recommender System as the next step in the pipeline.

Credits
The dataset used in this project is sourced fromm [here](https://www.kaggle.com/datasets/rounakbanik/pokemon).