main() {
    sudo apt update -y
    sudo apt install default-jre -y
    curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
    sudo apt update -y
    sudo apt install elasticsearch
    sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
    echo "discovery.type: single-node" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
    sudo systemctl enable elasticsearch
    sudo systemctl start elasticsearch


    sudo apt install kibana
    sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml
    sudo systemctl enable kibana
    sudo systemctl start kibana

    sudo apt install logstash
    cat <<EOF | sudo tee /etc/logstash/conf.d/pipeline1.conf
input {
  beats {
    port => 5044
    host => "0.0.0.0"
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "my-test-index"
  }
}
EOF
    sudo systemctl enable logstash
    sudo systemctl start logstash
}

main