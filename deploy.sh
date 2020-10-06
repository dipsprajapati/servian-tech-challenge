docker build -t dipsprajapati/serviantechchallenge-app:latest -t dipsprajapati/serviantechchallenge-app:$SHA -f ./TechChallengeAppResponse/TechChallengeApp/Dockerfile ./TechChallengeAppResponse/TechChallengeApp

docker push stephengrider/serviantechchallenge-app:latest

docker push dipsprajapati/serviantechchallenge-app:$SHA

kubectl apply -f k8s
kubectl set image deployments/app-deployment app=dipsprajapati/serviantechchallenge-app:$SHA