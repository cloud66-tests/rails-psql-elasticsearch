class Document < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  settings :analysis => {
      :filter => {
          :edge_ngram => {
              "type" => "edgeNGram",
              "max_gram" => 10,
              "min_gram" => 3,
              "side" => "front"
          }
      },
      :analyzer => {
          :autocomplete => {
              "tokenizer" => "lowercase",
              "filter" => ["edge_ngram"],
              "type" => "custom"
          }
      }
  } do
    mapping {
      indexes :name, :type => 'multi_field', :fields => {
          :name => {:type => "string"},
          :autocomplete => {:type => "string", :analyzer => "autocomplete"}
      }
      indexes :text, :type => 'string'
    }
  end
end
