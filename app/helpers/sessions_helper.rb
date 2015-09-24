module SessionsHelper
  def language_encodings
    [
        [t('application.helpers.languages.english'), 'en'],
        [t('application.helpers.languages.french'), 'fr'],
        [t('application.helpers.languages.german'), 'de'],
        [t('application.helpers.languages.flemish'), 'nl-BE']
    ]
  end
end
