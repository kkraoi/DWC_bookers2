class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  # 画像をリサイズして返す。画像が添付されてなければ、デフォルト画像(jpeg)を返す。
  #
  # ImageMagickとimage_processingのインストールが必要。
  # @param width [Integer] 画像の幅
  # @param height [Integer] 画像の高さ
  # @return [ActiveStorage::Variant] 投稿されたリサイズ済み画像 または デフォルト画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-profile_iamage.jpg')
      profile_image.attach(
        io: File.open(file_path),
        filename: 'default-image.jpg',
        content_type: 'image/jpeg'
      )
    end
    # 引数から受け取った値で画像サイズの変換を行なっている。
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
