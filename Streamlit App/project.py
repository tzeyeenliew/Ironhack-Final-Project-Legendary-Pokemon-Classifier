import streamlit as st
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import LabelEncoder

# Load the data
data = pd.read_csv('pokemon_cleaned.csv', encoding='utf-8')

# Feature engineering - Create the 'is_genderless' feature
data['is_genderless'] = data['percentage_male'].apply(lambda x: 1 if pd.isnull(x) else 0)

# Define the feature columns and target variable
features = ['base_total', 'capture_rate', 'experience_growth', 'height_m', 'hp', 'weight_kg', 'is_genderless', 'base_happiness']
target = 'is_legendary'

# Split the data into features and target
X = data[features]
y = data[target]

# Initialize the LabelEncoder
label_encoder = LabelEncoder()

# Convert the target variable to numeric
y = label_encoder.fit_transform(y)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Fit the Logistic Regression model with SMOTE
logisticregression_smote = LogisticRegression(max_iter=1000)
logisticregression_smote.fit(X_train, y_train)

# Function to make predictions
def predict_pokemon_legendary(features):
    # Make prediction on user input
    prediction = logisticregression_smote.predict([features])

    # Map the prediction to the corresponding label
    prediction_label = "Legendary" if prediction[0] == 1 else "Not Legendary"
    return prediction_label

def main():
    st.title('Legendary Pokemon Classifier')

    # Collect user input for prediction
    base_total = st.slider('Base Total', min_value=0, max_value=800, step=1)
    capture_rate = st.slider('Capture Rate', min_value=3, max_value=255, step=1)
    experience_growth = st.slider('Experience Growth', min_value=6000, max_value=1640000, step=1000)
    height_m = st.slider('Height (m)', min_value=0.1, max_value=14.5, step=0.1)
    hp = st.slider('HP', min_value=1, max_value=255, step=1)
    weight_kg = st.slider('Weight (kg)', min_value=0.1, max_value=999.9, step=0.1)
    is_genderless = st.checkbox('Is Genderless')
    base_happiness = st.slider('Base Happiness', min_value=0, max_value=255, step=1)

    # Collect the user input features
    user_input = [base_total, capture_rate, experience_growth, height_m, hp, weight_kg, int(is_genderless), base_happiness]

    # Make the prediction
    prediction_label = predict_pokemon_legendary(user_input)

    # Display the prediction result
    st.subheader("Prediction:")
    st.write("The Pokemon is predicted to be:", prediction_label)

if __name__ == '__main__':
    main()
