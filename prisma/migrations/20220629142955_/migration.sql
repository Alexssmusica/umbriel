-- DropForeignKey
ALTER TABLE "events" DROP CONSTRAINT "events_recipient_id_fkey";

-- DropForeignKey
ALTER TABLE "message_tags" DROP CONSTRAINT "message_tags_message_id_fkey";

-- DropForeignKey
ALTER TABLE "message_tags" DROP CONSTRAINT "message_tags_tag_id_fkey";

-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_sender_id_fkey";

-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_template_id_fkey";

-- DropForeignKey
ALTER TABLE "recipients" DROP CONSTRAINT "recipients_contact_id_fkey";

-- DropForeignKey
ALTER TABLE "recipients" DROP CONSTRAINT "recipients_message_id_fkey";

-- DropForeignKey
ALTER TABLE "subscriptions" DROP CONSTRAINT "subscriptions_contact_id_fkey";

-- DropForeignKey
ALTER TABLE "subscriptions" DROP CONSTRAINT "subscriptions_tag_id_fkey";

-- AddForeignKey
ALTER TABLE "subscriptions" ADD CONSTRAINT "subscriptions_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subscriptions" ADD CONSTRAINT "subscriptions_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_template_id_fkey" FOREIGN KEY ("template_id") REFERENCES "templates"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "senders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_recipient_id_fkey" FOREIGN KEY ("recipient_id") REFERENCES "recipients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recipients" ADD CONSTRAINT "recipients_message_id_fkey" FOREIGN KEY ("message_id") REFERENCES "messages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recipients" ADD CONSTRAINT "recipients_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "message_tags" ADD CONSTRAINT "message_tags_message_id_fkey" FOREIGN KEY ("message_id") REFERENCES "messages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "message_tags" ADD CONSTRAINT "message_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "contacts.email_unique" RENAME TO "contacts_email_key";

-- RenameIndex
ALTER INDEX "contacts.integration_id_unique" RENAME TO "contacts_integration_id_key";

-- RenameIndex
ALTER INDEX "recipients.message_id_contact_id_unique" RENAME TO "recipients_message_id_contact_id_key";

-- RenameIndex
ALTER INDEX "senders.email_unique" RENAME TO "senders_email_key";

-- RenameIndex
ALTER INDEX "subscriptions.contact_id_tag_id_unique" RENAME TO "subscriptions_contact_id_tag_id_key";

-- RenameIndex
ALTER INDEX "tags.integration_id_unique" RENAME TO "tags_integration_id_key";

-- RenameIndex
ALTER INDEX "tags.title_unique" RENAME TO "tags_title_key";

-- RenameIndex
ALTER INDEX "templates.title_unique" RENAME TO "templates_title_key";

-- RenameIndex
ALTER INDEX "users.email_unique" RENAME TO "users_email_key";
