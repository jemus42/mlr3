task = tsk("pima")
learner = lrn("classif.rpart")
learner$train(task)
self = learner$predict(task)

measure = msr("classif.acc")
measure$obs_loss(self$truth, self$response)



task = tsk("mtcars")
learner = lrn("regr.rpart")
learner$train(task)
self = learner$predict(task)

measure = msr("regr.mse")
measure$obs_loss(self$truth, self$response)

self$obs_loss(measure)


rr = resample(task, learner, rsmp("cv", folds = 3))

rr$predictions()
