class BloodBag
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization

  attr_accessor :bbag_Id, :bbag_ExternalId, :bbag_BloodProduct, :bbag_BloodGroup, :bbag_Rhesus, :bbag_AntigenList,
                :bbag_Status, :bbag_CheckOutTime, :bbag_CheckOutWard, :bbag_ExpirationTime, :bbag_TransfusionStartTime,
                :bbag_TransfusionEndTime, :bbag_TransfusionHCProvider, :bbag_TransfusionResp1, :bbag_TransfusionResp2,
                :bbag_TrsfResp1ExtraInfo, :bbag_TrsfResp2ExtraInfo, :bbag_Division, :bbag_ProductCode,
                :bbag_ProductMnemonic,:bbag_TransfusionResp1Function,:bbag_TransfusionResp2Function, :bbag_WardDetails,
                :bbag_StatusString, :bbag_BloodGroupString, :bbag_RhesusString, :bbag_CheckOutWardMnemonic,
                :bbag_TransfusionResp1FirstName, :bbag_TransfusionResp1LastName, :bbag_TransfusionResp2FirstName,
                :bbag_TransfusionResp2LastName, :bbag_TransfusionHCPrFullName, :bbag_TransfusionResp1FullName,
                :bbag_TransfusionResp2FullName, :bbag_ExpirationDateTime, :bbag_TransfusionStartDateTime,
                :bbag_TransfusionEndDateTime, :bbag_CheckOutDateTime, :bbag_TransfusionResp1FctnString,
                :bbag_TransfusionResp2FctnString


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # Define an +attributes+ method which returns a hash with each
  #   attribute name in your model as hash key and the attribute value as hash value.
  #   Hash keys must be strings
  # See also rails/activemodel/attribute_methods documentation
  def attributes
    {
        'bbag_Id' => @bbag_Id,
        'bbag_ExternalId' => @bbag_ExternalId,
        'bbag_BloodProduct' => @bbag_BloodProduct,
        'bbag_BloodGroup' => @bbag_BloodGroup,
        'bbag_Rhesus' => @bbag_Rhesus,
        'bbag_AntigenList' => @bbag_AntigenList,
        'bbag_Status' => @bbag_Status,
        'bbag_CheckOutTime' => @bbag_CheckOutTime,
        'bbag_CheckOutWard' => @bbag_CheckOutWard,
        'bbag_ExpirationTime' => @bbag_ExpirationTime,
        'bbag_TransfusionStartTime' => @bbag_TransfusionStartTime,
        'bbag_TransfusionEndTime' => @bbag_TransfusionEndTime,
        'bbag_TransfusionHCProvider' => @bbag_TransfusionHCProvider,
        'bbag_TransfusionResp1' => @bbag_TransfusionResp1,
        'bbag_TransfusionResp2' => @bbag_TransfusionResp2,
        'bbag_TrsfResp1ExtraInfo' => @bbag_TrsfResp1ExtraInfo,
        'bbag_TrsfResp2ExtraInfo' => @bbag_TrsfResp2ExtraInfo,
        'bbag_Division' => @bbag_Division,
        'bbag_ProductCode' => @bbag_ProductCode,
        'bbag_ProductMnemonic' => @bbag_ProductMnemonic,
        'bbag_TransfusionResp1Function' => @bbag_TransfusionResp1Function,
        'bbag_TransfusionResp2Function' => @bbag_TransfusionResp2Function,
        'bbag_WardDetails' => @bbag_WardDetails,
        'bbag_StatusString' => @bbag_StatusString,
        'bbag_BloodGroupString' => @bbag_BloodGroupString,
        'bbag_RhesusString' => @bbag_RhesusString,
        'bbag_CheckOutWardMnemonic' => @bbag_CheckOutWardMnemonic,
        'bbag_TransfusionResp1FirstName' => @bbag_TransfusionResp1FirstName,
        'bbag_TransfusionResp1LastName' => @bbag_TransfusionResp1LastName,
        'bbag_TransfusionResp2FirstName' => @bbag_TransfusionResp2FirstName,
        'bbag_TransfusionResp2LastName' => @bbag_TransfusionResp2LastName,
        'bbag_TransfusionHCPrFullName' => @bbag_TransfusionHCPrFullName,
        'bbag_TransfusionResp1FullName' => @bbag_TransfusionResp1FullName,
        'bbag_TransfusionResp2FullName' => @bbag_TransfusionResp2FullName,
        'bbag_ExpirationDateTime' => @bbag_ExpirationDateTime,
        'bbag_TransfusionStartDateTime' => @bbag_TransfusionStartDateTime,
        'bbag_TransfusionEndDateTime' => @bbag_TransfusionEndDateTime,
        'bbag_CheckOutDateTime' => @bbag_CheckOutDateTime,
        'bbag_TransfusionResp1FctnString' => @bbag_TransfusionResp1FctnString,
        'bbag_TransfusionResp2FctnString' => @bbag_TransfusionResp2FctnString
    }
  end

  def to_json(options = nil)
    serializable_hash(options).to_json
  end

  def externalize
    bbag_ProductMnemonic
  end
end