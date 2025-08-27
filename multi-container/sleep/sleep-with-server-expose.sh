# 서버 컨테이너의 포트를 주시하는 서비스 생성
kubectl expose -n multi-container -f sleep-with-server.yaml --type LoadBalancer --port 8020 --target-port 8080