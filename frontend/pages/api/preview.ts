import { drupal } from "lib/drupal"

export default async function (request, response) {
  return await drupal.preview(request, response)
}
