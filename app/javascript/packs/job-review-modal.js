const form = document.getElementById('new_job');
const typeOfWorkField = document.getElementById('job_name');
const timelineField = document.getElementById('job_deadline');
const contractField = document.getElementById('job_contract_type');
const budgetField = document.getElementById('job_price');
const descriptionField = document.getElementById('job_description');

const modalTypeOfWork = document.getElementById('modal-type-of-work');
const modalTimeline = document.getElementById('modal-timeline');
const modalContract = document.getElementById('modal-contract');
const modalBudget = document.getElementById('modal-budget');
const modalDescription = document.getElementById('modal-description');
const modalErrors = document.getElementById('modal-errors');

const timelineLabel = document.getElementById('timeline-label');
const contractLabel = document.getElementById('contract-label');
const budgetLabel = document.getElementById('budget-label');
const descriptionLabel = document.getElementById('description-label');

const reviewButton = document.getElementById('review-my-post');
const submitButton = document.getElementById('submit-job-post');

const fillFields = () => {
  if (typeOfWorkField.value) {
    modalTypeOfWork.innerHTML = typeOfWorkField.value;
  } else {
    modalErrors.innerHTML = '';
    modalErrors.insertAdjacentHTML("afterbegin", "<li>Type of Work is required</li>");
  }

  if (descriptionField.value) {
    modalErrors.innerHTML = '';
    descriptionLabel.innerHTML = "Description:"
    modalDescription.innerHTML = descriptionField.value;
  } else {
    modalErrors.insertAdjacentHTML("afterbegin", "<li>Job description is required</li>");
  }

  if (timelineField.value) {
    timelineLabel.innerHTML = "Timeline:";
  }
  modalTimeline.innerHTML = timelineField.value;

  if (budgetField.value) {
    budgetLabel.innerHTML = "Budget range:";
  }
  modalBudget.innerHTML = budgetField.value;

  if (contractField.value) {
    contractLabel.innerHTML = "Contract type:";
  }
  modalContract.innerHTML = contractField.value;
};

const buttonClick = () => {
  reviewButton.addEventListener('click', (event) => {
    fillFields();
  });
};

const submitForm = () => {
  submitButton.addEventListener('click', (event) => {
    form.submit();
  });
};

export { buttonClick, submitForm };
