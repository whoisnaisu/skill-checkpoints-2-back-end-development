import { Router } from "express";
import { pool } from "../utils/db.js";

const postRouter = Router();

postRouter.get("/", async (req, res) => {
  const category = req.query.category || "";
  const keywords = req.query.keywords || "";

  let query = "";
  let values = [];

  if (category && keywords) {
    query = `select * from posts
    where category=$1
    and title ilike $2`;
    values = [category, keywords];
  } else if (keywords) {
    query = `select * from posts
    where title ilike $1`;
    values = [keywords];
  } else if (category) {
    query = `select * from posts
    where category=$1`;
    values = [category];
  } else {
    query = `select * from posts`;
    values = [];
  }

  const results = await pool.query(query, values);

  return res.json({
    data: results.rows,
  });
});

postRouter.get("/:id", async (req, res) => {
  const postId = req.params.id;
  const result = await pool.query("select * from posts where post_id=$1", [
    postId,
  ]);
  return res.json({
    data: result.rows[0],
  });
});

postRouter.post("/create", async (req, res) => {
  const newPost = {
    ...req.body,
    created_at: new Date(),
    updated_at: new Date(),
  };

  await pool.query(
    `insert into posts (user_id, post_title, post_context, category_id, post_vote_count, created_at, updated_at) values ($1, $2, $3, $4, $5, $6, $7)`,
    [
      1,
      newPost.post_title,
      newPost.post_context,
      newPost.category_id,
      0,
      newPost.created_at,
      newPost.updated_at,
    ]
  );

  return res.json({
    message: "Post has been created.",
  });
});

postRouter.put("/:id", async (req, res) => {
  const updatedPost = {
    ...req.body,
    updated_at: new Date(),
  };
  const postId = req.params.id;

  await pool.query(
    `update posts
    set post_title=$1, post_context=$2, category=$3, updated_at=$4, where post_id=$5
  `,
    [
      updatedPost.post_title,
      updatedPost.post_context,
      updatedPost.category,
      updatedPost.updated_at,
      postId,
    ]
  );

  return res.json({
    message: `Post ${postId} has been updated.`,
  });
});

postRouter.delete("/:id", async (req, res) => {
  const postId = req.params.id;
  await pool.query(`delete from posts where post_id=$1`, [postId]);
  return res.json({
    message: `Post ${postId} has been deleted.`,
  });
});

postRouter.get("/:id/comments", async (req, res) => {
  const postId = req.params.id;
  const result = await pool.query("select * from posts where comment_id=$1", [
    postId,
  ]);
  return res.json({
    data: result.rows[0],
  });
});

postRouter.post("/:id/comments", async (req, res) => {
  const newComment = {
    ...req.body,
    created_on: new Date(),
    updated_on: new Date(),
  };

  await pool.query(
    `insert into posts (user_id, comment_title, comment, category, comment_vote_count, created_on, updated_on) values ($1, $2, $3, $4, $5, $6, $7)`,
    [
      1,
      newComment.comment_title,
      newComment.comment,
      newComment.category,
      0,
      newComment.created_on,
      newComment.updated_on,
    ]
  );

  return res.json({
    message: "Comment has been created.",
  });
});

postRouter.put("/:id/comments", async (req, res) => {
  const updatedComment = {
    ...req.body,
    updated_on: new Date(),
  };
  const postId = req.params.id;

  await pool.query(
    `update posts
    set comment_title=$1, comment=$2, category=$3, updated_on=$4, where post_id=$5
  `,
    [
      updatedComment.comment_title,
      updatedComment.comment,
      updatedComment.category,
      updatedComment.updated_on,
      postId,
    ]
  );

  return res.json({
    message: `Post ${postId} has been updated.`,
  });
});

export default postRouter;
