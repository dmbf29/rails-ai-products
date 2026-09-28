class Product < ApplicationRecord
  has_neighbors :embedding
  after_create :set_embedding

  private

  def set_embedding
    embedding = RubyLLM.embed("Product: #{name}. Description: #{description}")
    update(embedding: embedding.vectors)
  end
end
