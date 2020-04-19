import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['formContainer', 'albumsContainer'];

  connect() {
    console.log('Hello from AlbumsController!', this.formContainer)
  }

  showForm(event) {
    event.preventDefault();
    this.formContainer.classList.remove('hidden');
  }

  hideForm(event) {
    event.preventDefault();
    this.formContainer.classList.add('hidden');
  }

  success(event) {
    const [_data, _status, xhr] = event.detail;
    const html = xhr.response;

    if(/^\<form/.test(html)) {
      // Add the form
      this.formContainer.innerHTML = html;
    } else {
      // Add the album
      this.albumsContainer.insertAdjacentHTML('beforeend', html);
    }
  }

  get formContainer() {
    return this.formContainerTarget;
  }

  get albumsContainer() {
    return this.albumsContainer;
  }
}