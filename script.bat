echo "Criando as mensagens"

docker build -t wesl2x/projeto-backend:1.0 backend/. 
docker build -t wesl2x/projeto-database:1.0 database/.

echo "Enviando as imagens para o hub"

docker push wesl2x/projeto-backend:1.0
docker push wesl2x/projeto-database:1.0

echo "criando os services do cluster kubernets"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./pv.yml
kubectl apply -f ./pvc.yml
kubectl apply -f ./mysql-local.yml
kubectl apply -f ./deployment.yml



