require 'spec_helper'

describe Vote do
  context "validations" do
    it { should have_db_column(:value).with_options(default: 0) }
  end

  context "associations" do
    it { should belong_to(:user).dependent(:destroy) }
    it { should belong_to :post }
  end

end