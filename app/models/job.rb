class Job < ActiveRecord::Base
  include Sluggable

  validates :title, :description, :email, :company, presence: true
  validates :email, format: { with: /\A[a-z]([\.\-]?\w+)+@[a-z]([\.\-]?\w+){2,}\Z/ }
  validates :website, :url, format: { with: URI.regexp }, allow_blank: true

  default_scope { order(id: :desc) }
  scope :updated_at_desc, -> { order(updated_at: :desc) }

  # enumerator
  enum modality: { presencial: 0, remote: 1, freela: 2, trainee: 3 }
  enum salary: { undefined: 0, intern: 1, junior: 2, medium: 3, senior: 4 }

  def badge
    "#{modality}-badge.png"
  end

  def modality_name
    ['Presencial', 'Remoto', 'Freela', 'Trainee'][Job.modalities[modality]]
  end

  def salary_label
    ['N/A', 'Abaixo de R$3.000', 'R$3.000 - R$6.000', 'R$6.000 - R$9.000', 'Acima de R$9.000'][Job.salaries[salary]]
  end
end
