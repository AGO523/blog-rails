# 「es」はdocker-composeのservicesに設定した名前
config = {
  host:  ENV['ELASTICSEARCH_HOST'] || "localhost:3000/",
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
