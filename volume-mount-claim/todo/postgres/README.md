todo-web 배치 후 웹 서비스에 접속해서 아이템을 추가한다. 

그 후 데이터베이스 파드를 강제로 삭제
```shell
kubectl delete pod -n volume-mount-claim -l app=todo-db
```
위의 명령 실행후 볼륨의 데이터가 유지되는지 확인
```shell
kubectl exec -n volume-mount-claim deploy/sleep -- ls -l /node-root/volumes/pv01/pg_wal
```