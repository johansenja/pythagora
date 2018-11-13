const form = document.getElementById('new_job');
const typeOfWorkField = document.getElementById('job_name');
const timelineField = document.getElementById('job_deadline');
const contractField = document.getElementById('job_contact_type');
const budgetField = document.getElementById('job_price');
const descriptionField = document.getElementById('job_description');

const modalTypeOfWork = document.getElementById('modal-type-of-work');
const modalTimeline = document.getElementById('modal-timeline');
const modalContract = document.getElementById('modal-contract');
const modalBudget = document.getElementById('modal-budget');
const modalDescription = document.getElementById('modal-description');
const modalErrors = document.getElementById('modal-errors');

const reviewButton = document.getElementById('review-my-post');
const submitButton = document.getElementById('submit-job-post');

const fillFields = () => {
  if (typeOfWorkField.value) {
    modalTypeOfWork.innerHTML = typeOfWorkField.value;
  } else {
    modalErrors.innerHTML = '';
    modalErrors.insertAdjacentHTML("afterbegin", "<li>Type of Work is required</li>");
  }
  modalTimeline.innerHTML = timelineField.value;
  modalBudget.innerHTML = budgetField.value;
  if (descriptionField.value) {
    modalErrors.innerHTML = '';
    modalDescription.innerHTML = descriptionField.value;
  } else {

    modalErrors.insertAdjacentHTML("afterbegin", "<li>Job description is required</li>");
  }
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
