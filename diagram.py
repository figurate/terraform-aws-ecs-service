from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import ECS
from diagrams.aws.network import APIGateway, CloudMap, ELB
from diagrams.generic.blank import Blank

with Diagram("AWS ECS Service", show=False, direction="TB"):

    api_gw = APIGateway("api gateway")

    cloud_map = CloudMap("cloud map")
    api_gw << cloud_map

    with Cluster("vpc"):

        target_group = ELB("target_group (+)")

    with Cluster("ecs"):

     service = ECS("ecs service")
     api_gw >> service >> cloud_map

     service >> Edge(label="container:port (+)") >> target_group

    Blank("+ 1..n")