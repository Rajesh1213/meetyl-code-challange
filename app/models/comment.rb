class Comment

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  
  belongs_to :picture

  after :save, :add_to_elastic_index

	def add_to_elastic_index
		client = Comment.initiate_client
		client.index  index: 'code_challange', type: 'comment', id: self.id, body: picture.to_json(only: [:id, :title, :description])
	end

	def self.initiate_client
		Elasticsearch::Client.new log: true
	end

	def self.get_indexed_comments(picture_id)
		client = initiate_client
		response = client.search index: 'code_challange', type: 'comment', body: { query: { match: { id: picture_id } } }
		result = Hashie::Mash.new response
		comments_objects = result.hits.hits.map { |obj| Comment.get(obj['_id'].to_i) }
	end
end