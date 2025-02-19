# Augmentation & NLP Basics

## What is Augmentation? 🤖

AI models excel at classifying images, summarizing documents, translating text, and more. But how do these models learn, and how can we adapt them to our custom domain or use case?

Foundation models are trained on vast datasets using large-scale GPU servers, consuming significant resources. Since we can't afford such extensive training for every project, we use **transfer learning**, where we fine-tune specific layers of a pre-trained model using our sample data. However, even for fine-tuning, we need sufficient data, typically 300-400 samples. If we lack data, **augmentation** comes to the rescue!

### What is Augmentation? 🔄

Augmentation involves generating new variations of existing data samples without significantly altering their meaning or structure.

### Image Augmentation Techniques 🖼️
1. Image resizing
2. Image blurring
3. Brightness and contrast adjustment
4. Image rotation
5. Perspective transformation
6. Random cut-out
7. Color augmentation

### Text Augmentation Techniques 📝
1. Similar word replacement
2. Random insertion, substitution, and deletion of words/characters
3. Generating new sentences with the same meaning

With augmentation, we can generate a sufficient dataset for training, testing, and validating models.

> **Note:** Some production scenarios may be difficult to replicate via augmentation, so it should be used as a last resort.

---

## What is Tokenization? 🔢

**Tokenization** is an essential process in NLP, where text is broken down into smaller units called **tokens** (e.g., sentences into words, subwords, or root words). Popular tokenization tools in Python include **NLTK** and **spaCy**. Modern models use **Byte Pair Encoding (BPE)** for tokenization.

A token can be a single character or a word, depending on the tokenizer used in LLM training.

---

## Stemming vs. Lemmatization: Which One to Choose? 🌱

Both techniques help find the root or base words in NLP:
- **Stemming**: Faster but error-prone.
- **Lemmatization**: Slower but more reliable.

---

## What is Text Normalization? 🔍

Text normalization standardizes text by applying transformations such as:
- Lowercasing
- Stemming/Lemmatization
- Abbreviation expansion
- Converting numbers to text

---

## What is a Vector? 📊

After tokenization, text must be converted into numerical form since computers understand numbers. This process is called **vectorization**. Popular vectorization techniques include:
- Bag of Words (BoW)
- TF-IDF
- Embeddings

---

## Popular Model Metrics 📈
1. **Precision** – Ratio of true positives over total predicted positives (how accurate the model is).
2. **Recall** – Ratio of true positives over actual positives (how well the model identifies relevant cases).
3. **F1-score** – A balance between precision and recall.
4. **BLEU Score** – Measures how close machine translation is to human translation.

---

## Popular Text Similarity Methods 🔍
1. **BM25** – Used for basic text similarity.
2. **TF-IDF** – Used for standard text similarity.
3. **Semantic Similarity** – More advanced, meaning-based similarity.
4. **MMR (Maximal Marginal Relevance)** – Balances relevance and diversity in similarity comparisons.

---

## Common Machine Learning Algorithms 🤖

### Regression 📉
1. Linear Regression
2. Random Forest Regressor
3. Lasso Regression
4. Ridge Regression
5. Support Vector Regressor (SVR)

### Classification 📊
1. Logistic Regression
2. Random Forest
3. XGBoost (preferred, but if overfitting occurs, use Random Forest)
4. Naive Bayes
5. K-Nearest Neighbors (KNN)
6. Support Vector Machine (SVM)

### Clustering 🔍
1. K-Means
2. DBSCAN (optimal clusters determined via **Elbow Method** or **Silhouette Score**)
3. Hierarchical Clustering

---

## What is Variance and Bias? ⚖️
- **Variance**: If training accuracy is high but prediction accuracy is low, variance is high.
- **Bias**: If model predictions deviate significantly from actual values, bias is high.
- **High Bias** = Underfitting, **High Variance** = Overfitting.

---

## What is One-Hot Encoding? 🔢

Since ML models work with numbers, text data must be converted. **One-hot encoding** is one such technique.
- If a categorical feature has 5 unique values, it is transformed into 5 binary columns.
- Downside: Too many unique values can result in an explosion of columns!

---

## What is Ordinal Encoding? 🔢

- **Ordinal data**: Data with a defined order (e.g., Army ranks, subscription plans). Higher ranks get higher numbers.
- **Nominal data**: Data without a natural order (e.g., colors, names).
- **Ordinal Encoding** is suitable for ordered data, while nominal data requires other encoding methods.

---

## What is L1 and L2 Regularization? 🛠️

Regularization prevents overfitting:
- **L1 (Lasso)**: Randomly sets some weights to 0 (acts as feature selection).
- **L2 (Ridge)**: Distributes weights evenly to all features.

---

## What is the Curse of Dimensionality? 🚀

ML models work best when features have meaningful relationships. If a dataset has **too many features**, models struggle to find patterns. This is called the **curse of dimensionality**.

### Solutions:
- **Dimensionality Reduction Techniques**:
  - PCA (Principal Component Analysis)
  - t-SNE (t-Distributed Stochastic Neighbor Embedding)
  - LDA (Linear Discriminant Analysis)

---

## What is Correlation and P-Value? 📊

- **Correlation**: Measures how strongly two features are related.
  - High correlation between a feature and the target variable is good.
  - Low correlation between independent features is ideal.
- **P-value**: Indicates statistical significance.
  - Lower p-value (< 0.05) means a strong relationship.

> **Tip:** Use both **correlation (> 0.6)** and **p-value (< 0.05)** to evaluate feature importance.

---

## What is Cross-Validation? 🔄

Cross-validation ensures reliable model evaluation:
1. The dataset is split into **k** parts.
2. The model is trained on **k-1** parts and tested on the remaining part.
3. The process repeats **k** times, and the results are averaged.

This helps in reducing bias and variance in model evaluation.

---