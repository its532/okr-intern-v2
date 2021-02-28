class KeyResultComment < ApplicationRecord
  belongs_to :key_result

  validates :month,  uniqueness: { scope: [:key_result_id], message: ": その月のコメントは既に登録されています"  }
end
