config = {
  host: ENV['ELASTICSEARCH_HOST'] || "elasticsearch:9200/"
}
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
