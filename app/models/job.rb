class Job < ActiveRecord::Base
  include Sluggable

  validates :title, :description, :email, :company, :contact_by, presence: true
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }
  validates :website, :contact_url, format: { with: URI.regexp }, allow_blank: true

  default_scope { order(id: :desc) }
  scope :updated_at_desc, -> { order(updated_at: :desc) }

  enum contact_by: [:email, :url]
  enum modality: { presencial: 0, remote: 1, freela: 2, trainee: 3 }

  def badge
    "#{modality}-badge.png"
  end

  def modality_name
    ['Presencial', 'Remoto', 'Freela', 'Trainee'][Job.modalities[modality]]
  end
end
