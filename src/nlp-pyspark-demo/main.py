from pyspark.ml.linalg import Vectors
from pyspark.ml.classification import MultilayerPerceptronClassifier

# sample dataframe in ML format
train_df = spark.createDataFrame(
    [
        (1.0, Vectors.dense([0.0, 0.0, 5.0])),
        (1.0, Vectors.dense([0.0, 1.0, 4.5])),
        (1.0, Vectors.dense([1.0, 0.0, 2.0])),
        (1.0, Vectors.dense([1.0, 1.0, 1.0])),
    ],
    ["label", "features"],
)

# define a multi-layer neural network
# layers = number of input values (3), hidden layers (2), number of outputs (2 - either 1 or 0)
mlp = MultilayerPerceptronClassifier(layers=[3, 2, 2], seed=123)
mlp.setMaxIter(100)
mlp.setBlockSize(1)


model = mlp.fit(train_df)
model.setFeaturesCol("features")


# rather than spliting the dataframe into train and test, create a new
# test dataframe without labels, which would be used to get prediction from model
test_df = spark.createDataFrame(
    [(Vectors.dens([1.0, 1.0, 4.5]),), (Vectors.dens([0.0, 0.0, 4.5]),)], ["features"]
)


result_df = model.transform(test_df)
result_df.show()  # dataframe with prediction
