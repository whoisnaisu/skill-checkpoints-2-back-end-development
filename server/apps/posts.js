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
    `insert into posts insert into posts (user_id, title, context, category, upvote, downvote, created_at, updated_at) values ($1, $2, $3, $4, $5, $6, $7, $8)`,
    [
      2,
      newPost.title,
      newPost.context,
      newPost.category,
      0,
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
    set title=$1, context=$2, category=$3, upvote=$4, downvote=$5, updated_at=$6 where post_id=$7
  `,
    [
      updatedPost.title,
      updatedPost.context,
      updatedPost.category,
      updatedPost.upvote,
      updatedPost.downvote,
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
  const result = await pool.query(
    "select * from posts left join comments on posts.post_id = comments.post_id where posts.post_id=$1",
    [postId]
  );
  return res.json({
    data: result.rows[0],
  });
});

postRouter.post("/:id/comments", async (req, res) => {
  const newComment = {
    ...req.body,
    created_at: new Date(),
    updated_at: new Date(),
  };

  await pool.query(
    `insert into comments (post_id, user_id, comment, upvote, downvote, created_at, updated_at) values ($1, $2, $3, $4, $5, $6, $7)`,
    [
      newComment.post_id,
      10,
      newComment.comment,
      0,
      0,
      newComment.created_at,
      newComment.updated_at,
    ]
  );

  return res.json({
    message: "Comment has been created.",
  });
});

postRouter.put("/:id/comments", async (req, res) => {
  const updatedComment = {
    ...req.body,
    updated_at: new Date(),
  };
  const postId = req.params.id;

  await pool.query(
    `update posts
    set comment=$1, comment=$2, upvote=$3, downvote=$4, updated_at=$5, where post_id=$6
  `,
    [
      updatedComment.comment,
      updatedComment.upvote,
      updatedComment.downvote,
      updatedComment.updated_at,
      postId,
    ]
  );

  return res.json({
    message: `Post ${postId} has been updated.`,
  });
});

export default postRouter;
