require 'rails_helper'

describe PatientDataSet do
  let(:person_lexus) {
    {"prsn_Id" => 66368,"prsn_FirstName" => "Lexus","prsn_LastName" => "Kassulke","prsn_BirthDate" => "1997-08-14","prsn_Object" => 12,"prsn_Externalization" => "Kassulke, Lexus (M), 14\/08\/1997","prsn_Gender" => 1,"prsn_BagsAtLabOrWard" => 1}
  }

  let(:person_kari) {
    {"prsn_Id" => 66517,"prsn_FirstName" => "Kari","prsn_LastName" => "Yost","prsn_BirthDate" => "1933-07-31","prsn_Object" => 50,"prsn_Externalization" => "Yost, Kari (F), 31\/07\/1933","prsn_Gender" => 2,"prsn_BagsAtLabOrWard" => 0}
  }

  let(:person_douglas) {
    {"prsn_Id" => 66573,"prsn_FirstName" => "Douglas","prsn_LastName" => "Cleveland","prsn_BirthDate" => "1917-07-10","prsn_Object" => 106,"prsn_Externalization" => "Douglas, Cleveland (M), 10\/07\/1917","prsn_Gender" => 1,"prsn_BagsAtLabOrWard" => 0}
  }

  let(:tt_person) {
    {"tt_Person" => [person_lexus, person_kari, person_douglas]}
  }

  let(:ds_patients) {
    {"dsPatients" => tt_person }
  }

  let(:patient_data_set) { PatientDataSet.parse(build_httparty_response(ds_patients))}

  it 'returns \'dsPatients\' hash of this data set' do
    expect(patient_data_set.ds_patient).not_to be_nil
    expect(patient_data_set.ds_patient['dsPatients']).not_to be_nil
  end

  it 'returns the \'tt_Person\' hash of this data set' do
    expect(patient_data_set.tt_person).not_to be_nil
    expect(patient_data_set.tt_person['tt_Person']).not_to be_nil
    expect(patient_data_set.tt_person['tt_Person'].length).to eq(3)
  end

  it 'returns an array of Patient model instances' do
    expect(patient_data_set.patients).not_to be_nil
    expect(patient_data_set.patients.length).to eq(3)
    expect(patient_data_set.patients[0]).to be_an_instance_of(Patient)
  end
end