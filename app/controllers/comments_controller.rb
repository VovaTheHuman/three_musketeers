class CommentsController < ApplicationController
  # 1. Створення коментаря
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.account = current_account

    if @comment.save
      redirect_to root_path, notice: "Коментар додано!"
    else
      redirect_to root_path, alert: "Не вдалося додати коментар."
    end
  end

  # 2. ЛАЙК коментаря (те, чого зараз не вистачає)
  def like
    @comment = Comment.find(params[:id])
    # Шукаємо, чи вже є лайк від цього акаунта
    @reaction = @comment.comment_reactions.find_by(account: current_account)

    if @reaction
      @reaction.destroy # Якщо є — видаляємо (анлайк)
    else
      @comment.comment_reactions.create(account: current_account) # Якщо немає — створюємо
    end

    redirect_back fallback_location: root_path
  end

  # 3. ВИДАЛЕННЯ (через наш спеціальний GET маршрут)
  def delete
    destroy
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.account == current_account
      @comment.destroy
      redirect_back fallback_location: root_path, notice: "Коментар видалено."
    else
      redirect_back fallback_location: root_path, alert: "Ви не можете видалити чужий коментар!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end