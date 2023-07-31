<h1 style="text-align:center; font-weight:bold;">Pokemon Legendary Classifier Project</h1>

<h2 style="text-align:center;">Table of Contents</h2>
<ul>
  <li><strong>Introduction</strong></li>
  <li><strong>Getting the Data</strong></li>
  <li><strong>Setting the Scene: Preliminary Exploration</strong></li>
  <li><strong>Data Cleaning and Preprocessing</strong></li>
  <li><strong>Further Cleaning and Feature Selection</strong></li>
  <li><strong>Logistic Regression and Oversampling</strong></li>
  <li><strong>Other Binary Classification Models</strong></li>
  <li><strong>Conclusion</strong></li>
</ul>

<h2>1. Introduction</h2>
<p>This project aims to build a machine learning model to predict whether a Pokemon is legendary or not based on various features. The dataset used for this project contains information about different Pokemon, such as their base stats, abilities, and more. The goal is to develop an accurate and reliable classifier that can distinguish legendary from non-legendary Pokemon.</p>

<h2>2. Getting the Data</h2>
<p>The first step involves obtaining the dataset, which includes information about Pokemon characteristics and a binary indicator for whether a Pokemon is legendary. The data is loaded using pandas and inspected to understand its structure and content.</p>

<h2>3. Setting the Scene: Preliminary Exploration</h2>
<p>In this section, we perform preliminary exploration to gain insights into the dataset. We use techniques like Isolation Forest and Hypothesis Testing to identify potential outliers and correlations between features. This step helps us understand the data better before proceeding with the modeling process.</p>

<h2>4. Data Cleaning and Preprocessing</h2>
<p>Here, we clean the data and preprocess it for modeling. We handle missing values, perform feature extraction, and engineer new features if required. Additionally, we encode categorical variables and split the data into features (X) and the target variable (y).</p>

<h2>5. Further Cleaning and Feature Selection</h2>
<p>In this step, we conduct further cleaning and feature selection to optimize the feature set for modeling. We use domain knowledge, correlation analysis, and low variance filter techniques to retain only relevant features for training the models.</p>

<h2>6. Logistic Regression and Oversampling</h2>
<p>In this section, we use logistic regression as our initial binary classification model. Due to class imbalance, we apply oversampling techniques such as SMOTE, RandomOverSampler, and StratifiedKFold Cross Validation. We tune hyperparameters using GridSearchCV to enhance model performance.</p>

<h2>7. Other Binary Classification Models</h2>
<p>This section explores other binary classification models like KNeighborsClassifier, Decision Tree Classifier, and Gaussian Naive Bayes. We tune hyperparameters and evaluate each model's performance using accuracy, precision, recall, and F1-score.</p>

<h2>8. Conclusion</h2>
<p>In conclusion, this project builds and evaluates different binary classification models to predict legendary Pokemon. It showcases the effectiveness of logistic regression and other models while considering class imbalance. The evaluation metrics provide insights into the models' performance, helping us identify the most suitable model for the task.</p>

<h2>How to Use</h2>
<p>To run the project, follow these steps:</p>
<ol>
  <li>Clone the repository to your local machine.</li>
  <li>Install the required libraries using pip install.</li>
  <li>If you would like to open parts of the script separately, make sure to read the designated .csv file located in each folder.</li>
  <li>Before opening the presentation, make sure to install all font files located in the presentation folder beforehand so that the presentation appears as intended.</li>
  <li>Run the Streamlit app using the command streamlit run project.py.</li>
  <li>Feel free to explore the app and make predictions for different Pokemon using the chosen classification model!</li>
</ol>

<h2>Future Improvements</h2>
<p>Here are some potential future improvements for my project:</p>
<ul>
  <li>Perform more in-depth feature engineering, considering additional Pokemon attributes or external datasets (such as 8th generation Pokemon) to capture more information.</li>
  <li>Explore more advanced techniques for handling class imbalance, such as ensemble methods.</li>
  <li>Conduct a thorough error analysis to identify misclassifications and improve the model's performance -- for example, optimizing the GaussianNB model.</li>
  <li>Create a more interactive and user-friendly interface for the Streamlit app, allowing users to input custom Pokemon attributes for prediction.</li>
  <li>Building a Legendary Pokemon Recommender System as the next step in the pipeline.</li>
</ul>

<h2>Credits</h2>
<p>The dataset used in this project is sourced from <a href="https://www.kaggle.com/datasets/rounakbanik/pokemon">here</a>.</p>
