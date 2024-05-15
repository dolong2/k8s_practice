## 서비스
* 네트워크 애플리케이션의 접근을 관리하는 추상화된 리소스
* 여러 파드에 대한 로드밸런싱을 제공
* 파드가 지속적으로 변하는 환경에서도 안정적인 네트워크 접근을 보장
## 특징
* 로드밸런싱
  > 서비스는 동일한 라벨 셀렉터를 가진 여러 파드들 사이에 트래픽을 분산시킨다. 예를 들어, 여러 개의 웹 서버 파드에 균등하게 요청을 분배할 수 있다.
* 서비스 발견 및 클러스터 내부 통신
  > 서비스는 DNS 이름을 통해 클러스터 내의 다른 파드들이 접근할 수 있는 안정적인 엔드포인트를 제공한다. 쿠버네티스의 DNS 서버는 자동으로 각 서비스에 대한 DNS 엔트리를 생성한다.
* 고정된 IP와 이름 제공
  > 파드가 동적으로 생성되고 삭제되더라도 서비스는 고정된 IP 주소와 DNS 이름을 유지하여 안정적인 접근을 보장한다.
* 외부 접근
  > 서비스는 클러스터 외부에서 접근할 수 있는 방법을 제공 이를 위해 NodePort, LoadBalancer, Ingress 등의 타입을 사용할 수 있다.
## 타입
* ClusterIP (기본값)
  > 클러스터 내부에서만 접근 가능한 가상 IP 주소를 제공한다. 외부에서는 접근할 수 없는 주소이다.
주로 클러스터 내부에서 다른 파드들이 접근할 때 사용된다. 예). 내부 마이크로서비스 간 통신

* NodePort
  > 각 노드의 특정 포트를 통해 외부에서 접근할 수 있다. 클러스터의 모든 노드에서 동일한 포트를 사용하여 접근할 수 있습니다. 주로 외부에서 접근이 필요한 간단한 테스트나 개발 환경에서 사용된다.

* LoadBalancer
  > 클라우드 서비스 제공자(AWS, GCP, Azure 등)의 로드밸런서를 사용하여 외부 트래픽을 서비스에 분산한다. 클라우드 환경에서 외부 트래픽을 수신하는 프로덕션 환경에 적합하다

* ExternalName:
  > CNAME 레코드를 통해 외부 DNS 이름을 서비스 이름으로 사용할 수 있다. 외부 서비스에 대한 접근을 쿠버네티스 클러스터 내에서 간단하게 설정 가능.