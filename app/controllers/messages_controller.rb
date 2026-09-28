class MessagesController < ApplicationController
  SYSTEM_PROMPT = "
      You are an assistant for an e-commerce website. \
      Your task is to answer questions about the products and recommend the most relevant one and explain why. \
      Always share the name and URL of the product. \
      Your answer should be in markdown."

  def create
    @chat = Chat.find(params[:chat_id])
    # get the user's question
    embedding = RubyLLM.embed(params[:message][:content])
    # try to find the most relevant products FIRST
    @products = Product.nearest_neighbors(:embedding, embedding.vectors, distance: "euclidean").first(3)
    # then, we give those to the AI and let it do its magic
    if @chat.with_instructions("#{SYSTEM_PROMPT}\n#{give_relevant_products.join(', ')}").ask(params[:message][:content])
      redirect_to chat_path(@chat)
    else
      @message = @chat.messages.last
      render "chats/show", status: :unprocessable_entity
    end
  end

  def give_relevant_products
    # Only 3
    @products.map do |product|
      "ID: #{product.id}, Name: #{product.name}, Description: #{product.description}, Price: #{product.price}"
    end
  end

  # 🚨 This is going to be A LOT
  def give_all_products
    # if we have 1,000 products all of them will be in the prompt
    Product.all.map do |product|
      "Name: #{product.name}, Description: #{product.description}, Price: #{product.price}"
    end
  end

end
