 require 'spec_helper'



describe Post do
  context "validations" do
    it {should validate_presence_of :body }
  end

  context "associations" do
    it {should belong_to :user}
    it {should have_many :votes}
  end
end

describe Question do
  let(:my_question){FactoryGirl.create :question}
  let(:qattribs){FactoryGirl.attributes_for :question, body: "dat update"}
  let(:invalid_qattribs){FactoryGirl.attributes_for :question, body: ""}
  context "validations" do
    it {should validate_presence_of :title}
  end

  context "associations" do
    it {should have_many :answers}
  end

  context '#update_router' do
    context 'with invalid params' do
      it "should return ':back'" do
        expect(my_question.update_router(invalid_qattribs)).to eq :back
      end
    end

    context 'with invalid params' do
      it "should return 'self.id for question and self.question_id for answer'" do
        expect(my_question.update_router(qattribs)).to eq my_question.id
      end
    end
  end
end

describe Answer do
  let!(:my_question){FactoryGirl.create :question}
  let(:my_answer){FactoryGirl.create :answer, question: my_question}
  let(:ansattribs){ {body: "dat update", question_id: my_question.id} }
  let(:invalid_ansattribs){{body: "", question_id: my_question.id}}
  context "associations" do
    it {should belong_to :question}
  end

  context '#update_router' do
    context 'with invalid params' do
      it "should return ':back'" do
        expect(my_answer.update_router(invalid_ansattribs)).to eq :back
      end
    end

    context 'with invalid params' do
      it "should return 'self.id for question and self.question_id for answer'" do
        expect(my_answer.update_router(ansattribs)).to eq my_answer.question_id
      end
    end
  end
end