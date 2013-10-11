//using VersionR.Models;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Objects;
using System.Linq;
using System.Linq.Expressions;

namespace VersionR.DAL
{
    public class GenericRepository<TEntity> where TEntity : class
    {
        internal VersionRContext context;
        internal DbSet<TEntity> dbSet;

        public GenericRepository(VersionRContext context)
        {
            //this.context = new VersionRContext(objContext);
            this.context = context;
            dbSet = this.context.Set<TEntity>();
        }

        public virtual IEnumerable<TEntity> Get(
            Expression<System.Func<TEntity, bool>> filter = null,
            System.Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null)
        {
            IQueryable<TEntity> query = dbSet;

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (orderBy != null)
            {
                return orderBy(query).ToList();
            }
            else
            {
                return query.ToList();
            }
        }

        public virtual TEntity GetByID(object id)
        {
            return dbSet.Find(id);
        }

        public virtual void Insert(TEntity entity)
        {
            dbSet.Add(entity);
        }

        public virtual void Delete(TEntity entityToDelete)
        {
            //falls die Zeile gerade hinzugefügt wurde aber noch nicht attached (also "commited")
            if (context.Entry(entityToDelete).State == EntityState.Detached)
            {
                dbSet.Attach(entityToDelete);
            }
            dbSet.Remove(entityToDelete);
        }

        public virtual void Delete(IEnumerable<TEntity> entitiesToDelete)
        {
            foreach (var entity in entitiesToDelete)
            {
                this.Delete(entity);
            }
        }

        public virtual void Update(TEntity entityToUpdate)
        {
            dbSet.Attach(entityToUpdate);
            context.Entry(entityToUpdate).State = EntityState.Modified;
        }

        internal object Get(object filter)
        {
            throw new NotImplementedException();
        }
    }
}