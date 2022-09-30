module.exports = async function (context, req) {
  context.log('Received a request', {
    query: req.query || {},
    body: req.body || {},
  });
  context.res = {
    //status: 200, /* Defaults to 200 */
    body: {
      req: req,
      query: req.query || {},
      body: req.body || {},
    },
  };
};
