unless Document.index.exists?
  Document.create_elasticsearch_index
end